require 'rails_helper'

describe 'show one users', type: :feature do
  context 'visit /users/user_id' do
    before(:example) { visit "/users/#{User.first.id}" }

    it "I can see the user's profile picture."
    it "I can see the user's username."
    it "I can see the number of posts the user has written." do
      "Number of posts: 3"
      expect(page).to have_content "Number of posts: #{User.first.posts.count}"
    end
    it "I can see the user's bio." do
      expect(page).to have_content User.first.bio
    end
    it "I can see the user's first 3 posts." do
      Post.where(user: User.first).order(:created_at).limit(3).each do |post|
        expect(page).to post.title
      end
    end
    it "I can see a button that lets me view all of a user's posts."
    it "When I click a user's post, it redirects me to that post's show page."
    it "When I click to see all posts, it redirects me to the user's post's index page."

  end
end
