module SinatraBabies
  module Controllers
    class EventsController < Base

      before '/babies/:id/events*' do
        @baby = Baby.find(params[:id])
        unless logged_in? && @baby && @baby.parent_id == current_user.id
          redirect '/users/login?msg=not-allowed'
        end
        #Time.zone= current_user.timezone
        #Chronic.time_class = Time.zone
      end

      get '/babies/:id/events' do
        @events      = @baby.events.days_ago(0)
        @events.each do |event|
          event.time = event.time.in_time_zone(current_user.timezone)
        end
        @minutes_slept = @events.minutes_slept
        @poops = @events.poops
        @abnormals = @events.abnormals
        @next_button = "Yesterday" # make this toggle to nil if no more results
        @prev_button = nil
        erb :'events/index'
      end

      get '/babies/:id/events/new' do
        erb :'events/step-1'
      end


      get '/babies/:id/events/:days_ago' do
        @events = @baby.events.days_ago(params[:days_ago].to_i)
        unless @events.empty?
          @events.each do |event|
            event.time = event.time.in_time_zone("Santiago") # hardwired timezone!
          end
          @minutes_slept = @events.minutes_slept
          date = @events.first.time.to_date
          @poops = @events.poops
          @abnormals = @events.abnormals
          @current_date = date.strftime("%B %-d")
          @next_button = "Go to #{(date - 1).strftime("%B %-d")}" unless @baby.events.days_ago(params[:days_ago].to_i + 1).empty?
          @prev_button = "Back to #{(date + 1).strftime("%B %-d")}"
        else
          @events = nil
          @minutes_slept = nil
        end
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
        @event_description = EventDescription.find(params[:event][:event_description_id]) unless params[:event][:event_description_id].empty?
        erb :'events/step-3'
      end

      post '/babies/:id/events/new/confirmation' do
        @event_type = EventType.find(params[:event][:event_type_id])
        @event_description = EventDescription.find(params[:event][:event_description_id]) unless params[:event][:event_description_id].empty?
        @time = params[:event][:time]
        @date = params[:event][:date]
        erb :'events/confirmation'
      end

      post '/babies/:id/events/new' do
        @event = Event.new(params[:event])
        @event.baby = @baby
        @event.time = Chronic.parse(params[:event][:time])
        if @event.save
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :'events/step-1'
        end
      end

      get '/babies/:id/events/:event_id/edit' do
        @event = Event.find(params[:event_id])
        @event.time = @event.time.in_time_zone(current_user.timezone)
        if @event
          erb :'events/edit'
        else
          erb :'not_found'
        end
      end

      patch '/babies/:id/events/:event_id' do
        @event = Event.find(params[:event_id])
        @event.time = Chronic.parse("#{params["event"].delete("date")} #{params["event"].delete("time")}:00")
        params["event"].delete("event_description_id") if params[:event][:event_description_id].empty?
        @event.update(params[:event])
        
        if @event.save
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :"events/edit"
        end
      end

      delete '/babies/:id/events/:event_id' do
        if @event = Event.find(params[:event_id])
          @event.delete
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :'not_found'
        end
      end
    end
  end
end
