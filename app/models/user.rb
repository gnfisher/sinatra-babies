module SinatraBabies
  module Models
    class User < ActiveRecord::Base
      validates_presence_of :username, :email

      has_secure_password
    end
  end
end
