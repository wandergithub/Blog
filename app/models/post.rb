class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  def self.update_posts_counter(user)
    user.increment!(:PostsCounter)
  end

  def self.most_rescent_comments(post)
    Comment.where(post:).order(:created_at).limit(5)
  end
end
