class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def Like.update_likes_counter(post)
    likesCount = Like.where(post: post).count
    post.update(LikesCounter: likesCount)
  end
end