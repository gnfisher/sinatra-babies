module SinatraBabies
  module Controllers
    class Base
      module Helpers
        
        def logged_in?
          !!session[:user_id] && !User.where(id: session[:user_id]).empty?
        end

        def current_user
          @current_user ||= User.find(session[:user_id])
        end

        def set_time_zone
          Time.zone= current_user.timezone
          Chronic.time_class = Time.zone
        end
       
        def set_alert_message(msg)
          case msg
          when 'not-allowed'
            @message = {type: "warning", text: "Sorry, you're not allowed to access that."}
          when 'success'
            @message = {type: "success", text: "Success! We did it!"}
          else
            @message = nil
          end
        end

        def print_description(event)
          if event.event_description
            case event.event_description.text.downcase
            when /abnormal/
              "<span class=\"red\">#{event.event_description.text.capitalize}</span>"
            else
              event.event_description.text.capitalize
            end
          end
        end

        def format_date
          "#{params[:event][:date]} [#{params[:event][:time]}:00]"
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
