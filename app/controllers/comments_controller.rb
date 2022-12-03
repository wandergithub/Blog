class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.user = current_user
    comment.post = Post.find(params[:post_id])

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to '/users/1/posts/1/'
        else
          flash[:error] = 'Comment faild to create'
          render :new, locals: { comment: }
        end
      end
    end
  end
end
