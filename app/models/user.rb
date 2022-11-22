class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.most_rescent_posts(au)
    Post.where(user:).order(:created_at).limit(3)
  end
end
