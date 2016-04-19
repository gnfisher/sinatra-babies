module SinatraBabies
  module Controllers 
    class Base < Sinatra::Base
      configure do
        set :views, "app/views"
      end

      get '/' do
        "Hello, world"
      end
    end
  end
end

