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
      
      error ActiveRecord::RecordNotFound do
        erb :not_found
      end

      helpers Helpers

      get '/' do
        if logged_in?
          redirect '/babies'
        else
          erb :index
        end
      end

      post '/tasks/reseed' do
        # Check if user-agent matches ENV variable
        if params[:key] == ENV['SEED_KEY']
          require 'db/seeds'
        else
          500
        end
      end

    end
  end
end

