class SnowboardController < ApplicationController
  get '/snowboard/new' do
    if session[:id].nil?
      flash.now[:login_error] = "To create a snowboard please login"
      erb :'application/index'
    else
      @user = User.find_by(id: session[:id])
      erb :'/snowboard/new'
    end
  end
end
