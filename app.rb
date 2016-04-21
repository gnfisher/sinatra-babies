require 'rubygems'
require 'bundler'
require 'pry'

Bundler.require
$: << File.expand_path('../', __FILE__)

require 'dotenv'
Dotenv.load

require 'app/models'
require 'app/controllers'

module SinatraBabies
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure do
      set :database_file, "config/database.yml"
      set :views, 'app/views'
      enable :sessions
    end

    use Rack::Static, :urls => ['/css', '/js', '/fonts'], :root => 'public'
    use Rack::MethodOverride

    use SinatraBabies::Controllers::Base
    use SinatraBabies::Controllers::UsersController
    use SinatraBabies::Controllers::BabiesController

    not_found do
      erb :not_found, layout: false
    end
  end
end

include SinatraBabies::Models
