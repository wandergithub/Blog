require "rails_helper"

RSpec.describe 'Users', type: :request do
  describe 'GET users#index' do
    before(:each) do
      get '/users'
    end

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it "Response body includes correct text" do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET users#show' do
    before(:each) do
      get '/users/2'
    end

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it "Response body includes correct text" do
      expect(response.body).to include('Here is a specific user')
    end
  end

  describe 'GET posts#index' do
    before(:each) do
      get '/users/2/posts'
    end

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it "Response body includes correct text" do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET posts#show' do
    before(:each) do
      get '/users/2/posts/12'
    end

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it "Response body includes correct text" do
      expect(response.body).to include('Here is a post')
    end
  end
end