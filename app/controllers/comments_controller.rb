class CommentsController < ApplicationController

  before_action :require_account
  before_action :locate_post, only: [:create, :destroy]
  before_action :comment_belongs_to_current_account, only: [:destroy]

  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      @comment.user_id = session[:user_id]
      @comment.post_id = @post.id
      if @comment.save
        redirect_to root_path
      end
  end

  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to root_path, status: 303
  end

  private

    def locate_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter)
    end 
end
