class LikesController < ApplicationController
  def new
    post = Post.find(params[:id]);
    like  = Like.new(user: Post.find(params[:id]), post:)
    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = "Post liked"
          Like.update_likes_counter(post)
        else
          flash[:error] = "Couldn't like the post"
        end
      end
    end
    redirect_to request.referer
  end
end