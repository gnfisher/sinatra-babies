require 'rubygems'
require 'bundler'
require 'date'
require 'pry'

Bundler.require
$: << File.expand_path('../', __FILE__)

require 'dotenv'
Dotenv.load

require 'app/models'
require 'app/controllers'
#require 'fix/timezone'

module SinatraBabies
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure do
      set :database_file, "config/database.yml"
      set :views, 'app/views'
      enable :sessions
      set :session_secret, 'temp_secret'

      ActiveRecord::Base.default_timezone = :utc

    end

    use Rack::Static, :urls => ['/css', '/js', '/fonts'], :root => 'public'
    use Rack::MethodOverride

    use SinatraBabies::Controllers::Base
    use SinatraBabies::Controllers::UsersController
    use SinatraBabies::Controllers::BabiesController
    use SinatraBabies::Controllers::EventsController

    not_found do
      erb :not_found, layout: false
    end
  end
end

include SinatraBabies::Models
