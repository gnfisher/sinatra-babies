module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description


      def self.days_ago(days)
        Event.where('DATE(time) = ?', (Date.today - days)).order('time desc')
      end
    end
  end
end
