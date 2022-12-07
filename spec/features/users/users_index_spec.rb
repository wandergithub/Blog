require 'rails_helper'

describe 'User index', type: :feature do
  context 'visit /users' do
    before(:example) { visit users_path }
    before(:each) do
      @users = User.all
    end
    it 'I can see the username of all other users.' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'I can see the profile picture for each user.' do
      expect(page).to have_css('img', count: @users.length)
    end
    it 'I can see the number of posts each user has written.' do
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.PostsCounter}")
      end
    end
    it "When I click on a user, I am redirected to that user's show page." do
      user = User.first

      expect(page).to have_current_path(users_path)
      click_on user.name.to_s
      expect(page).to have_current_path(user_path(id: user.id))
    end
  end
end
