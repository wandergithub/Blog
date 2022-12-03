class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new(user: current_user, post:)
    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'Post liked'
          Like.update_likes_counter(post)
        else
          flash[:error] = "Couldn't like the post"
        end
      end
    end
    redirect_to request.referer
  end
end
