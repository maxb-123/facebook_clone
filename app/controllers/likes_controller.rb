class LikesController < ApplicationController
  before_action :set_post

  # POST /posts/:post_id/likes
  def create
    like = current_user.likes.build(post: @post)
    if like.save
      redirect_to @post, notice: 'You liked this post.'
    else
      redirect_to @post, alert: like.errors.full_messages.to_sentence
    end
  end

  # DELETE /posts/:post_id/likes/:id
  # Because likes are nested under posts, the :id param refers to the like ID
  def destroy
    like = current_user.likes.find_by(id: params[:id], post: @post)
    if like
      like.destroy
      redirect_to @post, notice: 'You unliked this post.'
    else
      redirect_to @post, alert: 'Unable to remove like.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end