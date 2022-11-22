class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_posts_counter(user)
    post_count = Post.where(user:).count
    user.update(PostsCounter: post_count)
  end

  def self.most_rescent_comments(post)
    Comment.where(post:).order(:created_at).limit(5)
  end
end
