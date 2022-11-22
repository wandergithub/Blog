class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_likes_counter(post)
    likes_count = Like.where(post:).count
    post.update(LikesCounter: likes_count)
  end
end
