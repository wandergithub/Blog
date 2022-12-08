class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

	def destroy
		comment = Comment.includes(post: [:user]).find(params[:id])
		post = comment.post
		if can? :destroy, comment
			comment.destroy
		end
		flash[:error] = 'cannot delete comment'
		redirect_to "/users/#{post.user.id}/posts/#{post.id}/"
	end


  def create
    comment = Comment.new(params.require(:comment).permit(:text))
		post = Post.find(params[:post_id])
    comment.user = current_user
    comment.post = post

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
        else
          flash[:error] = 'Comment faild to create'
        end
				redirect_to "/users/#{post.user.id}/posts/#{post.id}/"
      end
    end
  end
end
