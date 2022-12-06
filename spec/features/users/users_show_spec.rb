require 'rails_helper'

describe 'show one users', type: :feature do
  context 'visit /users/user_id' do
    before(:example) { visit "/users/#{User.first.id}" }

		it "I can see the user's profile picture."
		it "I can see the user's username."
		it "I can see the number of posts the user has written."
		it "I can see the user's bio."
		it "I can see the user's first 3 posts."
		it "I can see a button that lets me view all of a user's posts."
		it "When I click a user's post, it redirects me to that post's show page."
		it "When I click to see all posts, it redirects me to the user's post's index page."

  end
end
