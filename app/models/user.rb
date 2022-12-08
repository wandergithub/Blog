class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :PostsCounter, comparison: { greater_than_or_equal_to: 0 }

  def admin?
    role == 'admin'
  end

  def self.most_rescent_posts(user)
    Post.where(user:).order(:created_at).limit(3)
  end
end
