class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(:created_at).reverse_order
  end

  def show
    #
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post has been created"
      redirect_to posts_path
    else
      flash[:alert] = "Could not create post"
      render action: :new
    end
  end

  def edit
    #
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to @post
    else
      flash[:alert] = "Could not update post"
      render action: :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post has been deleted"
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = "You need to be admin to do that"
      redirect_to :back
    end
  end
end
