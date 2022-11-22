class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.most_rescent_posts(author)
    Post.where(author:).order(:created_at).limit(3)
  end
end
