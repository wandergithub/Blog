class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User'

  def self.update_comments_counter(post)
    post.increment!(:CommentsCounter)
  end
end
