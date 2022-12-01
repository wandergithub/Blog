class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.where(user_id: params[:user_id]).find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.user = current_user()
    post.CommentsCounter = 0
    post.LikesCounter = 0
    # respond_to block
    respond_to do |format|
      format.html do
        if post.save
          # success message
          flash[:success] = "Post saved successfully"
          # redirect to index
          redirect_to ('/users/1/posts')
        else
          # error message
          flash.now[:error] = "Error: Post could not be saved"
          # render new
          render :new, locals: { post: post }
        end
      end
    end
  end

end
