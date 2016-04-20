module SinatraBabies
  module Controllers
    class UsersController < Base

      get '/users/new' do
        erb :'users/new'
      end

    end
  end
end
