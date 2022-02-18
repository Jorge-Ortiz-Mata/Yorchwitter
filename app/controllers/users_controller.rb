class UsersController < ApplicationController

  before_action :require_user
  before_action :find_user, only: [:show, :edit, :update]

  def new
    if !(current_account.user.present?)
      @user = User.new
    else
      redirect_to root_path
    end
  end
  
  def create
    if !(current_account.user.present?)
      @user = User.new(user_params)
      @user.account_id = session[:user_id]
      if @user.save
        redirect_to root_path, notice: "Profile successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :genre, :location, :date_birth, :avatar)
    end

    def find_user
      @user = User.find_by(params[:id])
    end

end
