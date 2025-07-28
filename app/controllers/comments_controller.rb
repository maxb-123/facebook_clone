class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  # POST /posts/:post_id/comments
  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @post, notice: 'Comment added.'
    else
      redirect_to @post, alert: 'Unable to add comment.'
    end
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment removed.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_user!
    return if @comment.user == current_user
    redirect_to @post, alert: 'You are not authorized to perform this action.'
  end
end