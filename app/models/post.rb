class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def self.update_posts_counter(user)
    user.update(:PostsCounter)
  end

  def self.most_rescent_comments(post)
    Comment.where(post:).order(:created_at).limit(5)
  end
end
