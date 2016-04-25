module SinatraBabies
  module Models
    class EventType < ActiveRecord::Base
      has_many :events
    end
  end
end
