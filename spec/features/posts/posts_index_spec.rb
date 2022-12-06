require 'rails_helper'

describe "show all first user post", type: :feature do
  context 'visit /users/user_id/posts' do
    before(:example) { visit "/users/#{User.first}/posts" }

    it "I can see the user's profile picture."
    it "I can see the user's username."
    it "I can see the number of posts the user has written."
    it "I can see a post's title."
    it "I can see some of the post's body."
    it "I can see the first comments on a post."
    it "I can see how many comments a post has."
    it "I can see how many likes a post has."
    it "I can see a section for pagination if there are more posts than fit on the view."
    it "When I click on a post, it redirects me to that post's show page."

  end
end
