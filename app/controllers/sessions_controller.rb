class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.login_valid?
      session[:current_user] = true
      flash[:success] = "Welcome back, #{@user.username}"
      redirect_to root_path
    else
      @user.password = nil
      flash[:danger] = "Sorry, administrators only"
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Thanks for locking up"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
