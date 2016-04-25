module SinatraBabies
  module Controllers
    class EventsController < Base

      before '/babies/:id/events*' do
        unless logged_in?
          redirect '/users/login?msg=not-allowed'
        end
      end

      get '/babies/:id/events' do
        "It worked"
      end

      get '/babies/:id/events/new' do
        @baby = Baby.find(params[:id])
        if @baby && @baby.parent_id == current_user.id
          erb :'events/step-1'
        else
          redirect '/babies/not-your-baby'
        end
      end

      post '/babies/:id/events/new/step-2' do
        @event_type = EventType.find(params[:event][:event_type_id])
        @baby = Baby.find(params[:id])
        if @baby && @baby.parent_id == current_user.id
          if @event_type.name == "woke up" || @event_type.name == "fell asleep"
            @event_description = nil
            erb :'events/step-3'
          else
            erb :'events/step-2'
          end
        else
          redirect '/babies/not-your-baby'
        end
      end

      post '/babies/:id/events/new/step-3' do
        @event_type = EventType.find(params[:event][:event_type_id])
        @event_description = EventDescription.find(params[:event][:event_description_id]) unless params[:event][:event_description_id].empty?
        @baby = Baby.find(params[:id])
        if @baby && @baby.parent_id == current_user.id
          erb :'events/step-3'
        else
          redirect '/babies/not-your-baby'
        end
      end

      post '/babies/:id/events/new/confirmation' do
        @event_type = EventType.find(params[:event][:event_type_id])
        @event_description = EventDescription.find(params[:event][:event_description_id]) unless params[:event][:event_description_id].empty?
        @time = params[:event][:time]
        @baby = Baby.find(params[:id])
        if @baby && @baby.parent_id == current_user.id
          erb :'events/confirmation'
        else
          redirect '/babies/not-your-baby'
        end
      end

      post '/babies/:id/events/new' do
        @event = Event.new(params[:event])
        @event.time = format_date
        @baby = Baby.find(params[:id])
        if @baby && @baby.parent_id == current_user.id
          @event.baby = @baby
          if @event.save
            redirect "/babies?msg=success"
          else
            redirect "/babies/#{@baby.id}/events/new?msg=error"
          end
        end
      end
    end
  end
end
