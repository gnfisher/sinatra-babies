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

      get '/babies/new' do
        
      end


      get '/babies/:id' do
        @baby = Baby.find(params[:id]) 
        if @baby && @baby.parent_id == current_user.id
          erb :'babies/show'
        else
          redirect '/babies/not-your-baby'
        end
      end

      get '/babies/not-your-baby' do
        erb :'babies/not_your_baby'
      end
    
    end
  end
end
