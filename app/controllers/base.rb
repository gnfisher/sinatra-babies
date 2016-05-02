module SinatraBabies
  module Controllers 
    class Base < Sinatra::Base
      
      configure do
        set :views, "app/views"
        set :erb, escape_html: true
      end

      before do
        if params[:msg]
          set_alert_message(params[:msg])
        end

        if logged_in?
          set_time_zone
        end
      end

      helpers Helpers

      get '/' do
        "Hello, world! #{ENV["RACK_ENV"]}"
      end

    end
  end
end

