require 'rails_helper'

RSpec.describe 'User#index page', type: :feature do
  describe 'Page behavior' do
    it 'shows the username of all users' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'shows the profile picture for each user' do
      visit users_path
      users = User.all
      expect(page).to have_css('img', count: users.length)
    end
  end
end
