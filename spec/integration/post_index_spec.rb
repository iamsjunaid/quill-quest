require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  describe 'Post index page' do
    before :each do
      @user = User.create(name: 'Batman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Superhero',
                          posts_counter: 6)
      @post = Post.create(title: 'The Dark Night', text: 'This is my first post', comments_counter: 15,
                          likes_counter: 18, author: @user)
      @comment1 = Comment.create(author: @user, post: @post, text: 'This is my first comment')
      @comment2 = Comment.create(author: @user, post: @post, text: 'This is my second comment')
      @comment3 = Comment.create(author: @user, post: @post, text: 'This is my third comment')
      @like = Like.create(author: @user, post: @post)
        
      visit user_posts_path(user_id: @user.id)
    end

    it "shows user's profile picture" do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'shows the users username' do
      expect(page).to have_content('Batman')
    end

    it 'shows number of posts by user' do
      expect(page).to have_content('Number of posts: 7')
    end

    it 'shows posts title' do
      expect(page).to have_content('Post #')
    end

    it 'shows some of the posts body' do
      expect(page).to have_content 'This is my first post'
    end

    it 'shows the first comment on a post' do
      expect(page).to have_content 'This is my first comment'
    end

    it 'shows how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'shows how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'when user clicks on a post, it redirects to that posts show page' do
      click_link 'Post #'
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
