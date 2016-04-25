module SinatraBabies
  module Models
    class EventDescription < ActiveRecord::Base
      has_many :events
    end
  end
end
