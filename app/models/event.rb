module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description


      def self.days_ago(days)
        self.where('DATE(time) = ?', (Date.today - days)).order('time desc')
      end

      def self.hours_slept
        sleep_and_wakes = self.where(event_type_id: 1..2).map do |event|
          { event: (event.event_type_id == 1 ? "woke" : "slept"), time:  event.time }
        end.reverse!

        puts sleep_and_wakes
        puts
        
        day = sleep_and_wakes.first[:time].day
        month = sleep_and_wakes.first[:time].month
        year = sleep_and_wakes.first[:time].year

        midnight       = Time.new(year, month, day, 0,0,0, "+00:00") 
        end_of_day     = Time.new(year, month, day + 1, 0,0,0, "+00:00") 
        sleep_count    = 0
        still_sleeping = sleep_and_wakes.last[:event] == "slept" ? true : false
        
        if still_sleeping
          sleep_count += end_of_day - sleep_and_wakes.last[:time]
        end
          
        #binding.pry

        sleep_and_wakes.reduce(midnight) do |memo, hash|
          if hash[:event] == "slept"
            memo != nil ? memo : memo = hash[:time]
          else
            if memo != nil
              minutes      = hash[:time] - memo
              sleep_count += minutes
              memo         = nil
            else
              memo
            end
          end
        end
                
        hours_slept = {
          hours:          "#{sleep_count.to_i / 60 / 60}",
          minutes:        "#{sleep_count.to_i / 60 % 60}",
          still_sleeping: still_sleeping
        }
      end
    end
  end
end
