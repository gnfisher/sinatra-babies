module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description

      validates :baby, presence: true
      #validate :no_consecutive_sleeps_or_wakes

      #def no_consecutive_sleeps_or_wakes
      #  baby = Baby.find(baby_id)
      #  finish = time
      #  start  = time - 86400
      #  sleep_wakes = Event.where(time: start..finish).all_sleep_and_wakes
      #  unless sleep_wakes.empty?
      #    if sleep_wakes.last[:event_type_id] == event_type_id
      #      errors.add(:event_type_id, "cannot add two consecutive #{EventType.find(event_type_id).name} events")
      #    end
      #  end
      #end

      def self.days_ago(days)
        self.where('time between :start and :end',
                   start: Chronic.parse('0 in the morning') - (days * 86400),
                   end:   Chronic.parse('midnight') - (days * 86400)
                  ).
            order('time desc')
      end

      def self.minutes_slept
        if self.all_sleep_and_wakes.empty?
          return 0
        end
       
        sleep_wakes        = self.all_sleep_and_wakes
        current_day        = sleep_wakes.first[:time].strftime("%Y-%m-%d")
        current_time       = Chronic.parse("this second")
        beginning_of_day   = Chronic.parse("#{current_day} 00:00:00")
        end_of_day         = Chronic.parse("#{current_day} 00:00:00") + 86400
        seconds_slept      = 0
        
        # If latest sleep/wake event was a sleep AND the current day is today
        if still_sleeping?(sleep_wakes.last) && Chronic.parse(current_day) == Chronic.parse('noon')
          seconds_slept += current_time - sleep_wakes.last[:time]
        elsif still_sleeping?(sleep_wakes.last)
          seconds_slept += end_of_day - sleep_wakes.last[:time]
        end
        
        # If oldest sleep/wake event is the same as the oldest sleep/wake event 
        # of ALL sleep/wake events for this baby, start counter at time of that event
        # else start counting from beginning_of_day
        #
        # TODO: Is the call to all_sleep_and_wakes.first behaving as I think it is?
        #  - Investigate.
        if sleep_wakes.first == all_sleep_and_wakes.first
          seconds_counter = sleep_wakes.first.time
        else
          seconds_counter = beginning_of_day
        end
          
        # Total time between sleep and wakes, ignoring when sleeps follow sleeps
        # or wakes follow wakes
        # TODO: when sleeps follow sleeps, the first sleep gets ignore and it shouldnt
        sleep_wakes.reduce(seconds_counter) do |memo, event|
          if event[:event_type_id] == 2
            memo != nil ? memo : memo = event[:time]
          else
            if memo != nil
              seconds        = event[:time] - memo
              seconds_slept += seconds
              memo           = nil
            else
              memo
            end
          end
        end
        (seconds_slept / 60).to_i
      end

      def self.all_sleep_and_wakes
        self.select { |event| event.event_type_id.between? 1, 2 }.reverse
      end

      def self.still_sleeping?(last_event)
        last_event[:event_type_id] == 2 ? true : false
      end
      
      def self.poops
        self.select { |event| event.event_type_id == 4 }.size
      end

      def self.abnormals
        self.select { |event| event.event_description_id == 4}.size
      end
    end
  end
end
