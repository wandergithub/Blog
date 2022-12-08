class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :CommentsCounter, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :update_posts_counter_d

  def update_posts_counter
    user.increment!(:PostsCounter)
  end

  def update_posts_counter_d
    user.decrement!(:PostsCounter)
  end

  def self.most_rescent_comments(post)
    Comment.where(post:).order(:created_at).limit(5)
  end
end
