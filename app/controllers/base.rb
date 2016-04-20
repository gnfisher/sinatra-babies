module SinatraBabies
  module Controllers 
    class Base < Sinatra::Base
      register Sinatra::Flash
      
      configure do
        set :views, "app/views"
        set :erb, escape_html: true
      end

      get '/' do
        "Hello, world! #{ENV["RACK_ENV"]}"
      end
    end
  end
end

