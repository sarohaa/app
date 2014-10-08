class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def isloggedin
    if session[:user]
    else
      redirect_to signin_path
    end
    end
end
