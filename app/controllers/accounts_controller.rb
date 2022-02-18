class AccountsController < ApplicationController
  before_action :find_account, except: [:new, :create, :index]
  before_action :require_user, except: [:new, :create]

  def new
    @account = Account.new
  end

  def show
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
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to @account, notice: 'Account successfully updated.'
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
