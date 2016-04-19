module SinatraBabies
  module Controllers 
    class Base < Sinatra::Base
      configure do
        set :views, "app/views"
      end

      get '/' do
        "Hello, world! #{ENV["RACK_ENV"]}"
      end
    end
  end
end

