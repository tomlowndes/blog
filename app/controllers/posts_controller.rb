class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_prams

    if @post.save
      redirect_to @post, notice: "Hellz yeah, Tom! Your article was successfully saved!"
    else
      render 'new', notice: "Oh no, Tom! I was unable to save your post."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_prams
      redirect_to @post, notice: "Huzzah! Your article was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path
  end

  private

  def post_prams
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
