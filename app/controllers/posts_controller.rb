class PostsController < ApplicationController

  before_action :require_account
  before_action :locate_post, except: [:new, :create]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_account
    if @post.save
      redirect_to root_path, notice: 'Post created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

    def post_params
      params.require(:post).permit(:body, image: [])
    end

    def locate_post
      @post = Post.find(params[:id])
    end

end
