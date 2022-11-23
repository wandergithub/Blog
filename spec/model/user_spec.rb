require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'validations' do
    before(:all) do
      @user  = User.new(name:)
    end
    it 'name should be present' do
      expect(@user).to be_valid
    end

  end
end