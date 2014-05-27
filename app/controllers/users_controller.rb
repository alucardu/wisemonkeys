class UsersController < ApplicationController
before_action :set_user, only: [:destroy]
before_action :change, :only => [:destroy, :index]
  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @user = User.all
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
