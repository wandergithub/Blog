class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User'

  after_save :update_comments_counter

	after_destroy :reduce_comments_counter

	private

	def reduce_comments_counter
		post.decrement!(:CommentsCounter)
	end


  def update_comments_counter
    post.increment!(:CommentsCounter)
  end
end
