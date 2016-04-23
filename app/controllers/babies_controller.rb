module SinatraBabies
  module Controllers
    class BabiesController < Base
      
      before '/babies*' do
        unless logged_in?
          redirect '/users/login?msg=not-allowed'
        end
      end

      get '/babies' do
        @babies = Baby.get_by_parent_id(current_user.id)
        erb :'babies/index'
      end

      get '/babies/not-your-baby' do
        erb :'babies/not_your_baby'
      end

      get '/babies/new' do
        @user = current_user
        erb :'babies/new'
      end

      post '/babies' do
        @baby = Baby.new(params[:baby])
        @baby.user_id = current_user.id
        if @baby.save
          redirect "/babies/#{@baby.id}?msg=success"
        else
          erb :'babies/new'
        end
      end

      get '/babies/:id' do
        @baby = Baby.find(params[:id]) 
        if @baby && @baby.parent_id == current_user.id
          @message = print_message(params[:msg])
          erb :'babies/show'
        else
          redirect '/babies/not-your-baby'
        end
      end    

      delete '/babies/:id/delete' do
        baby = Baby.find(params[:id])
        if baby.user_id == current_user.id
          baby.delete
          redirect '/babies'
        else
          redirect '/babies/not-your-baby'
        end
      end

    end
  end
end
