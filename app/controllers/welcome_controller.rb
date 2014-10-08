class WelcomeController < ApplicationController
  def index
  end
  def about
  end
  def new
  	@user = User.new
  end
  def signin
  	@user = User.new
  end
  
end
