class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post has been created"
      redirect_to @post
    else
      flash[:alert] = "Could not create post"
      redirect_to posts_path
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
    params.require(:post).permit(:title, :content)
  end
end
