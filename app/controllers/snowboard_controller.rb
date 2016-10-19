class SnowboardController < ApplicationController
  get '/snowboard/new' do
    if logged_in?
      erb :'snowboard/new'
    else
      flash.now[:login_error] = "To create a snowboard please login"
      erb :'application/index'
    end
  end

  post '/snowboard/new' do

    snowboard = Snowboard.new(params[:snowboard])
    if logged_in?
      current_user.snowboards << snowboard
      redirect '/quiver'
    else
      flash.now[:login_error] = "To create a snowboard please login"
      erb :'application/index'
    end
  end

  get '/snowboard/:id/edit' do
    @snowboard = Snowboard.find_by_id(params[:id])
    if logged_in? && current_user == @snowboard.user
      erb :'snowboard/edit'
    else
      flash.now[:login_error] = "To edit this snowboard please log into the correct account"
      erb :'application/index'
    end
  end

  get '/snowboard/:id' do
    @snowboard = Snowboard.find_by_id(params[:id])
    erb :'snowboard/show'
  end

  post '/snowboard/:id' do
    snowboard = Snowboard.find_by_id(params[:id])
    if logged_in? && current_user == snowboard.user
      snowboard.update(params[:snowboard])
    end

      redirect to("/snowboard/#{params[:id]}")
  end

end
