class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def Comment.update_comments_counter(post)
    commentsCount = Comment.where(post: post).count
    post.update(CommentsCounter: commentsCount)
  end
end