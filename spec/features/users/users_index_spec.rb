require 'rails_helper'

describe 'show one users', type: :feature do
  context 'visit /users' do
    before(:example) { visit users_path }

		it "I can see the username of all other users."
		it "I can see the profile picture for each user."
		it "I can see the number of posts each user has written."
		it "When I click on a user, I am redirected to that user's show page."
  end
end
