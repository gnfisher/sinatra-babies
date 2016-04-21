module SinatraBabies
  module Controllers 
    class Base < Sinatra::Base
      
      configure do
        set :views, "app/views"
        set :erb, escape_html: true
      end

      helpers Helpers

      get '/' do
        "Hello, world! #{ENV["RACK_ENV"]}"
      end
    end
  end
end

