module SinatraBabies
  module Models
    class Event < ActiveRecord::Base
      belongs_to :baby
      belongs_to :event_type
      belongs_to :event_description
    end
  end
end
