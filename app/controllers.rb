module SinatraBabies
  module Controllers
    # Load controllers
    autoload :Base, 'app/controllers/base'
    autoload :UsersController, 'app/controllers/users_controller'
    autoload :BabiesController, 'app/controllers/babies_controller'
    
    # Load helpers module
    autoload :Helpers, 'app/helpers'
  end
end
