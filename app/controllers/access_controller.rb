class AccessController < ApplicationController

  layout 'admin'

  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorised_user = found_user.authenticate(params[:password])
      end
    end
    if authorised_user
      # Todo: mark users logged in
      flash[:notice] = "You are now logged in"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password"
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end

  def confirmed_logged_in
    flash[:notice] = "Please log in"
    redirect_to(:action => 'login')
    return false # halts the before_action
  else
    return true
  end
  

end
