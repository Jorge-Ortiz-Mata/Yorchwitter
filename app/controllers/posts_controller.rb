class PostsController < ApplicationController

  before_action :require_account
  before_action :locate_post, except: [:new, :create]
  before_action :post_belongs_to_current_account, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to root_path, notice: 'Post created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path, status: :see_other, alert: 'Post deleted.'
    @post.destroy
  end

  private 

    def post_params
      params.require(:post).permit(:body, images: [])
    end

    def locate_post
      @post = Post.find(params[:id])
    end

end
