class SnowboardController < ApplicationController
  get '/snowboard/new' do
    if logged_in?
      erb :'/snowboard/new'
    else
      flash.now[:login_error] = "To create a snowboard please login"
      erb :'application/index'
    end
  end
end
