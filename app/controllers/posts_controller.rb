class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:success] = "Post was successfully created."
      redirect_to posts_path
    else
      flash[:alert] = "No photo, no bueno. Photo por favor!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
