require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Jhon', photo: 'https://example.com/image', bio: 'any text')
    end

    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'PostsCounter should be an integer greater or equal to zero' do
      @user.PostsCounter = nil
      expect(@user).to_not be_valid
      @user.PostsCounter = -12
      expect(@user).to_not be_valid
      @user.PostsCounter = 0
      expect(@user).to be_valid
    end
  end
end
