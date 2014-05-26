class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

  def new
    @user = User.new
  end

  def check_authentication_token
  end

  def create
    @user = User.new(user_params)
    if @user.save
      RegistrationMailer.new_registration_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :authentication_token)
    end

end
