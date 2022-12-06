require 'rails_helper'

describe 'show all first user post', type: :feature do
  context 'visit /users/user_id/posts' do
    let(:user) do
      User.find(3)
    end
    let(:post) do
      user.posts.first
    end
    before(:example) { visit user_posts_path(user_id: user)}

    it "I can see the user's profile picture." do
      expect(page.find('img')['src']).to have_content(user.photo)
    end
    it "I can see the user's username." do
      expect(page).to have_content(user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{user.PostsCounter}")
    end
    it "I can see a post's title." do
      expect(page.find("#post_#{post.id}").find(".post")).to have_selector('h2', text: post.title)
    end
    it "I can see some of the post's body." do
      expect(page).to have_selector('p' , text: post.text.slice(0,20))
    end
    it 'I can see the first comments on a post.' do
      expect(page).to have_content(post.comments.first.text)
    end
    it 'I can see how many comments a post has.' do
      expect(page.find("#post_#{post.id}")).to have_content("Comments: #{post.CommentsCounter}")
    end
    it 'I can see how many likes a post has.' do
      expect(page.find("#post_#{post.id}")).to have_content("Likes: #{post.LikesCounter}")
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button 'Pagination'
    end
    it "When I click on a post, it redirects me to that post's show page." do
      click_on "#{post.title}"

      expect(page).to have_current_path(user_post_path(user_id: user.id, id: post.id ))
    end
  end
end
