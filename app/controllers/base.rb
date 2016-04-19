module SinatraBabies
  module Controllers 
    class Base < Sinatra::Application
      configure do
        set :views, "app/views"
      end

      get '/' do
        "Hello, world"
      end
    end
  end
end

