class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  
  def most_rescent_posts()
    Post.where(user: self).order(:created_at).limit(3)
  end
end