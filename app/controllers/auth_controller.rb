class AuthController < ApplicationController
  def login
  end

  def login_auth
    user = User.find_by(username: params[:username])
    #byebug
    if user.password == params[:password]
      redirect_to auth_dashboard_path
    else
      redirect_to auth_login_path
    end
  end

  def signup
  end

  def create
    user = User.create!(username: params[:username], password: params[:password])
    if user
      redirect_to auth_login_path
    else
      redirect_to auth_signup_path
    end
  end

  def dashboard
  end
end
