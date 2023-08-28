require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'this is a bio',
                     posts_counter: 12)

  subject do
    Post.new(title: 'this is a title', text: 'this is text', author: user)
  end

  before { subject.save }

  describe 'GET #index' do
    before(:example) { get user_posts_path(user_id: 1) } # get(:index)
    it 'returns http success' do
      # get '/posts'
      # get posts_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      # get '/posts'
      # get posts_path
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      # get '/posts'
      # get posts_path
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path(user_id: 1, id: 1) }
    it 'returns http success' do
      # get "/posts/#{subject.id}"
      # get posts_path(subject)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      # get "/posts/#{subject.id}"
      # get posts_path(subject)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      # get "/posts/#{subject.id}"
      # get posts_path(subject)
      expect(response.body).to include('Here is a post for a given user')
    end
  end
end
