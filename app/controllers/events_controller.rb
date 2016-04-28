module SinatraBabies
  module Controllers
    class EventsController < Base

      before '/babies/:id/events*' do
        @baby = Baby.find(params[:id])
        unless logged_in? && @baby && @baby.parent_id == current_user.id
          redirect '/users/login?msg=not-allowed'
        end
      end

      get '/babies/:id/events' do
        @events      = @baby.events.days_ago(0)
        @next_button = "Yesterday"
        @prev_button = nil
        erb :'events/index'
      end

      get '/babies/:id/events/new' do
        erb :'events/step-1'
      end


      get '/babies/:id/events/:days_ago' do
        @events = @baby.events.days_ago(params[:days_ago].to_i)
        unless @events.empty?
          date = @events.first.time.to_date
          @current_date = date.strftime("%B %-d")
          @next_button = "Go to #{(date - 1).strftime("%B %-d")}" unless @baby.events.days_ago(params[:days_ago].to_i + 1).empty?
          @prev_button = "Back to #{(date + 1).strftime("%B %-d")}"
        else
          @events = nil
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
        if @event.save
          redirect "/babies/#{@baby.id}/events?msg=success"
        else
          erb :'events/step-1'
        end
      end
    end
  end
end
