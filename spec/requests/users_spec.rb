require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { User.new(name: 'Tom & Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Best friends', posts_counter: 12) }

  before { subject.save }

  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'returns http success' do
      # get '/users'
      # get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      # get '/users'
      # get users_path
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      # get '/users'
      # get users_path
      expect(response.body).to include('Here is a list of all the users')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(subject) } # get(:show)
    it 'returns http success' do
      # get "/users/#{subject.id}"
      # get user_path(subject)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      # get "/users/#{subject.id}"
      # get user_path(subject)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      # get "/users/#{subject.id}"
      # get user_path(subject)
      expect(response.body).to include('Here is the given user')
    end
  end
end
