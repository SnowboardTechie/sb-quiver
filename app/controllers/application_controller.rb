require './config/environment'

class ApplicationController < Sinatra::Base
  include Helpers
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  use Rack::Flash


  get '/' do
    if logged_in?
      redirect '/quiver'
    else
      erb :'application/index'
    end
  end

  post '/login' do
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect '/quiver'
    else
      flash.now[:login_error] = "Unable to authenticate please try again."
      erb :'application/index'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
