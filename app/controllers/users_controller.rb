module SinatraBabies
  module Controllers
    class UsersController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.new(params[:user])
        if @user.save
          erb :'babies/index'
        else
          erb :'users/new'
        end
      end

      get '/users/login' do
        if logged_in?
          redirect '/babies'
        end
        
        @message = print_message(params[:msg]) if params[:msg]   
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

      get '/users/login-failed' do
        erb :'users/login_failed'
      end
      
      get '/users/logout' do
        session.clear
        erb :'users/loggedout'
      end
      
      def print_message(msg)
        case msg
        when 'not-allowed'
          "Sorry, you have to be logged in to access that resource. Login below or <a href='/users/new'>Register an account</a>."
        end
      end

    end
  end
end
