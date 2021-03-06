module SinatraBabies
  module Controllers
    class UsersController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.new(params[:user])
        if @user.save
          session[:user_id] = @user.id
          redirect '/babies'
        else
          erb :'users/new'
        end
      end

      get '/users/login' do
        if logged_in?
          redirect '/babies'
        end
        
        erb :'users/login'
      end

      post '/users/login' do
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect '/babies'
        else
          redirect '/users/login-failed'
        end
      end

      get '/users/edit' do
        erb :'users/edit'
      end

      patch '/users/edit' do
        user = @current_user
        user.update_column(:timezone, params[:user][:timezone])
        redirect '/users/edit'
      end

      get '/users/login-failed' do
        erb :'users/login_failed'
      end
      
      get '/users/logout' do
        session.clear
        erb :'users/loggedout'
      end
    end
  end
end
