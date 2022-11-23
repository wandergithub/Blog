require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = Post.new(user: User.new, title: 'Post Title', text: 'text sample')
  end

  describe 'Validation' do
    it 'Title should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'Title should not exceed 250 characters' do
      @post.title = "a"*251
      expect(@post).to_not be_valid
    end
  end
end