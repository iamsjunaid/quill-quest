class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :find_user, only: [:index]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    respond_to do |_format|
      if @post.save
        redirect_to user_posts_path(current_user)
      else
        render :new
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    # Delete all likes and comments associated with the post
    @post.likes.destroy_all
    @post.comments.destroy_all

    if @post.destroy
      redirect_to user_posts_path(current_user), notice: 'Post deleted successfully'
    else
      flash.new[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :show, status: 400
    end
  end

  def find_user
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
