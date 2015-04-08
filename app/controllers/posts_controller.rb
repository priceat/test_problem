class PostsController < ApplicationController
  def index
    @current_user = User.first
    @posts = @current_user.posts
  end

  def new
    @current_user = User.first
    @post = Post.new
  end

  def create
    @current_user = User.first
    @post = Post.new(post_params)
    if @post.save
      redirect_to :index
    else
      render :new
    end
  end

  def edit
    @current_user = User.first
    @post = Post.find(params[:id])
  end

  def update
    @current_user = User.first
    @post =Post.find(params[:id])
    if @post.update_attributes(allowed_params)
      redirect_to :index
    else
      render :edit
    end
  end

  def show
    @current_user = User.first
    @posts = Post.find(params[:id])
  end

  def destroy
    @current_user = User.first
    @posts = current_user.posts
  end

  private

  def post_params
    params.require[:post].allow(:title, :body)
  end
end
