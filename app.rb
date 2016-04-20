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
    end

    use SinatraBabies::Controllers::UsersController
  end
end

include SinatraBabies::Models
