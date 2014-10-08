class UsersController < ApplicationController
  before_action :isloggedin,:except => [:check,:create,:show,:signup]
  def index
    @user = User.all

  end
  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
     
      redirect_to @user
    else
      
      render "welcome/index"
    end
  end
  def show
    @user = User.find(params[:id])
  end

  
    
  
  def check
    @user = User.find_by_email(params[:user][:email])
  if @user  
     respond_to do |format|
     if found_user = @user.authenticate(params[:user][:password])
      session[:user] = found_user.id
        format.html { redirect_to articles_path(id: found_user.id), notice: 'You Are Successfully Logged In' }
        format.json {}
      else
        flash[:error] = "Incorrect Password,Try Again!"
        format.html { redirect_to signin_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   else
    flash[:error] = "Incorrect Email Address,Try Again!"
  redirect_to root_path
end
  end
  def logout
    session[:user] = nil
    redirect_to root_path
  end



  private 
  def user_params
  	params.require(:user).permit(:username,:password, :email,:password_confirmation)
  end
  
end
