module SinatraBabies
  module Models
    class User < ActiveRecord::Base
      validates_presence_of :username, :email
      validates :password, length: { minimum: 8 }, allow_nil: true

      has_secure_password
    end
  end
end
