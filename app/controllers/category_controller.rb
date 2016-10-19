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
        redirect '/quiver'
      else
        flash.now[:category_error] = "Category name invalid please try again."
        erb :'/category/new'
      end
    else
      flash.now[:login_error] = "To create a category please login"
      erb :'application/index'
    end
  end

  get '/category/:slug' do
    @category = Category.find_by_slug(params[:slug])
    if logged_in? && @category.user == current_user
      erb :'category/show'
    else
      redirect '/quiver'
    end
  end

  post '/category/:id/delete' do
    category = Category.find_by_id(params[:id])
    if logged_in? && category.user == current_user
      category.destroy
    end
    redirect '/quiver'
  end

  get '/category/all' do
    erb :'category/all'
  end
end
