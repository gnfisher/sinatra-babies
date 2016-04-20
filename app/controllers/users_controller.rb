module SinatraBabies
  module Controllers
    class UsersController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.new(params[:user])
        if @user.save
          200
        else
          flash[:errors] = @user.errors
          redirect '/users/new'
        end
      end

    end
  end
end
