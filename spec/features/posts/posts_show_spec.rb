require 'rails_helper'

describe "show first post complete", type: :feature do
  context 'visit /users/user_id/posts/post_id' do
    before(:example) { visit "/users/#{Post.first.author.id}/posts/#{Post.first.id}" }


    it "I can see the post's title."
    it "I can see who wrote the post."
    it "I can see how many comments it has."
    it "I can see how many likes it has."
    it "I can see the post body."
    it "I can see the username of each commentor."
    it "I can see the comment each commentor left."


  end
end
