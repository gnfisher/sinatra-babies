module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description

      validates :baby, presence: true
      #validate  :no_consecutive_sleeps_or_wakes

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
        if self.all.empty? || self.all_sleep_and_wakes.empty?
          return 0
        end
       
        
        sleep_wakes        = self.all_sleep_and_wakes
        current_day        = sleep_wakes.first[:time].strftime("%Y-%m-%d")
        current_time       = Chronic.parse("this second")
        beginning_of_day   = Chronic.parse("#{current_day} 00:00:00")
        end_of_day         = Chronic.parse("#{current_day} 00:00:00") + 86400
        seconds_slept      = 0
        
        if still_sleeping?(sleep_wakes.last) && Chronic.parse(current_day) == Chronic.parse('noon')
          seconds_slept += current_time - sleep_wakes.last[:time]
        elsif still_sleeping?(sleep_wakes.last)
          seconds_slept += end_of_day - sleep_wakes.last[:time]
        end
          
        sleep_wakes.reduce(beginning_of_day) do |memo, event|
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
        self.where(event_type_id: 1..2).reverse
      end

      def self.still_sleeping?(last_event)
        last_event[:event_type_id] == 2 ? true : false
      end
    end
  end
end
