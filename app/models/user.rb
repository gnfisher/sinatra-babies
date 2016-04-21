module SinatraBabies
  module Models
    class User < ActiveRecord::Base
      validates_presence_of :username, :email
      validates :password, length: { minimum: 8 }, allow_nil: true
      validates :username, length: { in: 6..12 }

      has_secure_password

      has_many :babies
    end
  end
end
