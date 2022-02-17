class AccountsController < ApplicationController

  before_action :find_account, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:new, :create]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:user_id] = @account.id
      redirect_to new_user_path, notice: 'Please, now introduce you information.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def updated
  end

  def destroy
    session[:user_id] = nil
    @account.destroy
    redirect_to root_path, alert: 'Account delete.'
  end

  private 

    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation)
    end

    def find_account
      @account = Account.find_by(params[:id])
    end
end
