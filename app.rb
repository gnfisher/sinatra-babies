require 'rubygems'
require 'bundler'
require 'pry'

Bundler.require
$: << File.expand_path('../', __FILE__)

require 'dotenv'
Dotenv.load

require 'app/controllers'

module SinatraBabies
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    configure do
      set :database_file, "config/database.yml"
     end

    use SinatraBabies::Controllers::Base
  end
end

