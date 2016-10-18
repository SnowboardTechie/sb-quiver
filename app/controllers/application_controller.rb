require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  use Rack::Flash


  get '/' do
    erb :'application/index'
  end

  post '/login' do
    user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect '/quiver'
    else
      flash[:login_error] = "Unable to authenticate please try again."
      redirect '/'
    end
  end
end
