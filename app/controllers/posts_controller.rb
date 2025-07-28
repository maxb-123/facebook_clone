class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  # GET /posts
  # Shows a list of recent posts
  def index
    @posts = Post.includes(:user, :likes, comments: :user).order(created_at: :desc)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content)
  end

  # Only allow the owner of the post to modify it
  def authorize_user!
    return if @post.user == current_user

    redirect_to posts_path, alert: 'You are not authorized to perform this action.'
  end
end