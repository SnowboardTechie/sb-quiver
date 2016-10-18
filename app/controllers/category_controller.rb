class CategoryController < ApplicationController
  get '/category/new' do
    if session[:id].nil?
      flash.now[:login_error] = "To create a category please login"
      erb :'application/index'
    else
      @user = User.find_by(id: session[:id])
      erb :'/category/new'
    end
  end
end
