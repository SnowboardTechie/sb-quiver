class CategoryController < ApplicationController
  get '/category/new' do
    if logged_in?
      erb :'/category/new'
    else
      flash.now[:login_error] = "To create a category please login"
      erb :'application/index'
    end
  end
end
