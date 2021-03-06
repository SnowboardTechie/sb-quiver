class UserController < ApplicationController
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /^[a-zA-Z]\w{3,14}$/

  get '/signup' do
    if logged_in?
      redirect '/quiver'
    else
      erb :'user/signup'
    end
  end

  post '/signup' do
    email_check = params[:user][:email] =~ VALID_EMAIL_REGEX
    password_check = params[:user][:password] =~ VALID_PASSWORD_REGEX

    if password_check.nil? || email_check.nil?
      if !email_check
        flash.now[:email_error] = "Invalid email address"
      end
      if !password_check
        flash.now[:password_error] = "Invalid password"
      end
      erb :'user/signup'
    else
      user = User.create(params[:user])
      session[:id] = user.id
      redirect '/quiver'
    end
  end

  get '/quiver' do
    if logged_in?
      erb :'user/quiver'
    else
      flash.now[:login_error] = "To view quiver please login"
      erb :'application/index'
    end
  end
end
