class UserController < ApplicationController
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /^[a-zA-Z]\w{3,14}$/

  get '/signup' do
    erb :'user/signup'
  end

  post '/signup' do
    email_check = params[:user][:email] =~ VALID_EMAIL_REGEX
    password_check = params[:user][:password] =~ VALID_PASSWORD_REGEX

    if password_check.nil? || email_check.nil?
      if !email_check
        flash[:email_error] = "Invalid email address"
      end
      if !password_check
        flash[:password_error] = "Invalid password"
      end
      redirect '/signup'
    else
      user = User.create(params[:user])
      session[:id] = user.id
      redirect '/quiver'
    end
  end
end
