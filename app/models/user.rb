module SinatraBabies
  module Models
    class User < ActiveRecord::Base
      validates_presence_of :username, :email
      validates :password, length: { minimum: 8 }, allow_nil: true
      validates :username, length: { in: 6..12 }

      has_secure_password

      has_many :babies

      def self.timezones
        [
          "Santiago", 
          "Eastern Time (US & Canada)", 
          "Central Time (US & Canada)", 
          "Mountain Time (US & Canada)", 
          "Pacific Time (US & Canada)"
        ]
      end
    end
  end
end
