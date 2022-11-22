class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  
  def User.most_rescent_posts(user)
    Post.where(user: user).order(:created_at).limit(3)
  end
end