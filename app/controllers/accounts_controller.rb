class AccountsController < ApplicationController

  before_action :find_account, except: [:new, :create, :index]
  before_action :require_account, except: [:new, :create]
  before_action :account_belongs_to_current_account, only: [:edit, :update, :destroy]

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

  def update
    if @account.update(account_params)
      redirect_to user_path(@current_account), notice: 'Account successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    @account.destroy
    redirect_to root_path, alert: 'Account deleted.'
  end

  private 

    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation)
    end

    def find_account
      @account = Account.find(params[:id])
    end
end
