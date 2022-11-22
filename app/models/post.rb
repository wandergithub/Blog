class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def Post.update_posts_counter(user)
    postCount = Post.where(user: user).count
    user.update(PostsCounter: postCount)
  end

  def Post.most_rescent_comments(post)
    Comment.where(post: post).order(:created_at).limit(5)
  end
end