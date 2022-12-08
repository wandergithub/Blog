class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
  end

  def show
    @id = params[:id]
    @user_id = params[:user_id]
    @post = Post.includes(comments: [:user]).where(user_id: @user_id).find(@id)
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post:, user_id: params[:user_id] } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.user = current_user
    post.CommentsCounter = 0
    post.LikesCounter = 0
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(user_id: params[:user_id])
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :destroy, post
    
    respond_to do |format|
      format.html do
        if post.destroy
          flash[:success] = 'Post Deleted successfully'
          redirect_to request.referer
        else
          flash.now[:error] = 'Error: Post could not be deleted'
          redirect_to request.referer
        end

      end

    end

  end

end
