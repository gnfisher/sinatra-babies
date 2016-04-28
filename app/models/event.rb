module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description


      def self.days_ago(days)
        self.where('DATE(time) = ?', (Date.today - days)).order('time desc')
      end

      def self.minutes_slept
        sleep_wakes q      = self.all_sleep_and_wakes
        Time.zone          = "UTC"
        Chronic.time_class = Time.zone
        current_day        = sleep_wakes.first[:time].strftime("%Y-%m-%d") 
        beginning_of_day   = Chronic.parse("#{current_day} 00:00:00")
        end_of_day         = Chronic.parse("#{current_day} 00:00:00") + 86400
        seconds_slept      = 0
        
        if still_sleeping?(sleep_wakes.last)
          seconds_slept += end_of_day - sleep_wakes.last[:time]   
        end
          
        sleep_wakes.reduce(beginning_of_day) do |memo, event|
          if event[:event_type_id] == 2
            memo != nil ? memo : memo = event[:time]
          else
            if memo != nil
              seconds      = event[:time] - memo
              seconds_slept += seconds
              memo         = nil
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
