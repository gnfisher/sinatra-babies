module SinatraBabies
  module Controllers
    # Load controllers
    autoload :Base, 'app/controllers/base'
    autoload :UsersController, 'app/controllers/users_controller'
    
    # Load helpers module
    autoload :Helpers, 'app/helpers'
  end
end
