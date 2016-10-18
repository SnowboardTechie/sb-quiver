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

end
