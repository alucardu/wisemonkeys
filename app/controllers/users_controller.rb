class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

  def new
    @user = User.new
  end


  def checktoken
    user = User.find_by(authentication_token: params[:authentication_token])
    if user.present?
      user.activated = true
      redirect_to pictures_path
    else
      redirect_to competitions_path
    end
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
