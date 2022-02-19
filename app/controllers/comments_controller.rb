class CommentsController < ApplicationController

  before_action :require_account
  before_action :locate_comment, except: [:new, :create]
  # before_action :user_belongs_to_current_account, only: [:edit, :update, :destroy]

  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.new(comment_params)
      @comment = session[:user_id]
      if @comment.save
        redirect_to root_path, notice: "Comment created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_path, notice: "Comment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path, status: :see_other, alert: "Comment deleted."
    @comment.destroy
  end

  private

    def locate_comment
    end

    def comment_params
    end
 
end
