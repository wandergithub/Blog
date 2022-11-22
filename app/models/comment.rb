class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.update_comments_counter(post)
    comments_count = Comment.where(post:).count
    post.update(CommentsCounter: comments_count)
  end
end
