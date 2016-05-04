module SinatraBabies
  module Controllers
    class EventsController < Base

      before '/babies/:id/events*' do
        @baby = Baby.find(params[:id])
        unless logged_in? && @baby.user_id == @current_user.id
          redirect '/users/login?msg=not-allowed'
        end
      end

      get '/babies/:id/events/new' do
        erb :'events/step-1'
      end

      get '/babies/:id/events' do
        @events     = @baby.events.days_ago(0)
        @more_pages = !@baby.events.days_ago(params[:days_ago].to_i + 1).empty?

        erb :'events/index'
      end

      get '/babies/:id/events/:days_ago' do
        @events     = @baby.events.days_ago(params[:days_ago].to_i)
        @more_pages = !@baby.events.days_ago(params[:days_ago].to_i + 1).empty?
        
        erb :'events/index'
      end

      post '/babies/:id/events/new/step-2' do
        @event_type = EventType.find(params[:event][:event_type_id])
        
        if @event_type.name == "woke up" || @event_type.name == "fell asleep"
          @event_description = nil
          erb :'events/step-3'
        else
          erb :'events/step-2'
        end
      end

      post '/babies/:id/events/new/step-3' do
        @event_type = EventType.find(params[:event][:event_type_id])
        unless params[:event][:event_description_id].empty?
          @event_description = EventDescription.find(params[:event][:event_description_id]) 
        end
        
        erb :'events/step-3'
      end

      post '/babies/:id/events/new/confirmation' do
        @event_type = EventType.find(params[:event][:event_type_id])
        @time       = params[:event][:time]
        @date       = params[:event][:date]
        unless params[:event][:event_description_id].empty?
          @event_description = EventDescription.find(params[:event][:event_description_id]) 
        end
        
        erb :'events/confirmation'
      end

      post '/babies/:id/events/new' do
        @event      = Event.new(params[:event])
        @event.time = Chronic.parse(params[:event][:time])
        @event.baby = @baby

        if @event.save
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :'events/step-1'
        end
      end

      get '/babies/:id/events/:event_id/edit' do
        @event      = Event.find(params[:event_id])
        @event.time = @event.time.in_time_zone(current_user.timezone)
        
        erb :'events/edit'
      end

      patch '/babies/:id/events/:event_id' do
        @event      = Event.find(params[:event_id])
        @event.time = Chronic.parse("#{params["event"].delete("date")} #{params["event"].delete("time")}:00")
        
        if params[:event][:event_description_id].empty?
          params["event"].delete("event_description_id") 
        end
        
        @event.update(params[:event])
        
        if @event.save
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :"events/edit"
        end
      end

      delete '/babies/:id/events/:event_id' do
        @event = Event.find(params[:event_id])
        @event.delete
        
        redirect "/babies/#{@baby.id}/events?msg=success"
      end
    end
  end
end
