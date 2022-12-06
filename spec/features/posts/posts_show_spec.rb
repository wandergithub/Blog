require 'rails_helper'
require 'database_cleaner/active_record'

describe 'show first post complete', type: :feature do
  context 'visit /users/user_id/posts/post_id' do
    let(:post) do
      Post.first
    end
    before(:example) { visit "/users/#{post.user.id}/posts/#{post.id}" }

    it "I can see the post's title." do
      expect(page).to have_content(post.title)
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content(post.user.name)
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content("Comments: #{post.CommentsCounter}")
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content("Likes: #{post.LikesCounter}")
    end
    it 'I can see the post body.' do
      expect(page).to have_content(post.text.slice(0, 50))
    end
    it 'I can see the username of each commentor.' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end
    it 'I can see the comment each commentor left.' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    it 'can see the user name of the post author' do
      expect(page).to have_content(post.author.name)
      end
    end
  end
end
