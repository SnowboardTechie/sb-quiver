class CategoryController < ApplicationController
  get '/category/new' do
    if logged_in?
      erb :'/category/new'
    else
      flash.now[:login_error] = "To create a category please login"
      erb :'application/index'
    end
  end

  post '/category/new' do
    if logged_in?
      category = Category.new(params[:category])
      if category.valid?
        current_user.categories << category
      else
        flash.now[:category_error] = "Category name invalid please try again."
        erb :'/category/new'
      end
    else
      flash.now[:login_error] = "To create a category please login"
      erb :'application/index'
    end
  end
end
