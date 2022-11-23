class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  def self.update_likes_counter(post)
    post.increment!(:LikesCounter)
  end
end
