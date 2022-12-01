class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.where(user_id: params[:user_id]).find(params[:id])
  end
end
