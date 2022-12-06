require 'rails_helper'

describe 'user show page', type: :feature do
  context 'visit /users/user_id' do
    let(:user) do
      user = User.first
    end
    before(:example) { visit user_path(id: user.id) }

    it "I can see the user's profile picture." do
      expect(page.find('img')['src']).to have_content(user.photo)
    end
    it "I can see the user's username." do
      expect(page).to have_content(user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content "Number of posts: #{user.posts.count}"
    end
    it "I can see the user's bio." do
      expect(page).to have_content user.bio
    end
    it "I can see the user's first 3 posts." do
      Post.where(user:).order(:created_at).limit(3).each do |post|
        expect(page).to have_content post.title
      end
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_link 'See all posts'
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      post = user.posts.first
      
      click_on "#{post.title}"

      expect(page).to have_current_path(user_post_path(user_id: user.id, id: post.id))
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_on 'See all posts'
      expect(page).to have_current_path(user_posts_path(user_id: user.id))
    end
  end
end
