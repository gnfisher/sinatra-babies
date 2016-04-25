module SinatraBabies
  module Controllers
    class Base
      module Helpers
        
        def logged_in?
          !!session[:user_id]
        end

        def current_user
          @current_user ||= User.find(session[:user_id])
        end
        
        def print_message(msg)
          case msg
          when 'not-allowed'
            "Sorry, you have to be logged in to access that resource. Login below or <a href='/users/new'>Register an account</a>."
          when 'success'
            "Success!"
          when nil
            nil
          end
        end
        
        def format_date
          "#{Time.now.strftime("%Y-%m-%d")} [#{params[:event][:time]}:00]"
        end

        # Form helpers
        
        def has_error?(obj, field)
          if obj.respond_to? "errors"
            unless obj.errors[field].empty?
              "has-error"
            end
          end
        end

        def has_content?(obj, field)
          obj.send(field) if obj
        end

      end
    end
  end
end
