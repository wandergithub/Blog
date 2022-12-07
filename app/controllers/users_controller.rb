class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @most_rescent_posts = User.most_rescent_posts(@user)
  end
end
