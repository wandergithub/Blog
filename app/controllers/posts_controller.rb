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
      format.html { render :new, locals: { post: } }
    end
  end

  def new_comment
    comment = Comment.new
    respond_to do |format|
      format.html { render :new_comment, locals: { comment: } }
    end
  end

  def create_comment
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.user = current_user
    comment.post = Post.find(params[:id])

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to '/users/1/posts/1/'
        else
          flash[:error] = 'Comment faild to create'
          render :new_comment, locals: { comment: }
        end
      end
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.user = current_user
    post.CommentsCounter = 0
    post.LikesCounter = 0
    # respond_to block
    respond_to do |format|
      format.html do
        if post.save
          # success message
          flash[:success] = 'Post saved successfully'
          # redirect to index
          redirect_to('/users/1/posts')
        else
          # error message
          flash.now[:error] = 'Error: Post could not be saved'
          # render new
          render :new, locals: { post: }
        end
      end
    end
  end

  def like
    Like.update_likes_counter(Post.find(params[:id]))

    redirect_to request.referer
  end
end
