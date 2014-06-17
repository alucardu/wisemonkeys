class UsersController < ApplicationController
before_action :set_user, only: [:destroy, :edit, :show, :update]
before_action :change, :only => [:destroy, :index, :edit, :update]
  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
    @competitions = @user.competitions
  end

  def new
    @user = User.new
  end


  def checktoken
    user = User.find_by(authentication_token: params[:authentication_token])
    if user.present?
      user.update_attribute(:activated, true)
      redirect_to pictures_path
    else
      redirect_to competitions_path
    end
  end


  def create
    @user = User.new(user_params)
    @user.authentication_token = SecureRandom.urlsafe_base64
    if @user.save
      RegistrationMailer.new_registration_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def index
    @user = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
  end

  def destroy
    @user.destroy
    redirect_to :back
  end

  private
     def change
      if signed_in?
        unless current_user.administrator?
          redirect_to root_path, notice: 'U bent niet gemachtigd'
        end
      else
        redirect_to root_path, notice: 'U bent niet gemachtigd'
      end
    end
    def set_user
      @user=User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :administrator, :b_account)
    end

end
