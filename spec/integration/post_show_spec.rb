require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  before :each do
    @user = User.create(name: 'Batman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Superhero',
                        posts_counter: 6)
    @post = Post.create(title: 'The Dark Night', text: 'This is my first post', comments_counter: 15,
                        likes_counter: 18, author: @user)
    @comment1 = Comment.create(author: @user, post: @post, text: 'This is my first comment')
    @comment2 = Comment.create(author: @user, post: @post, text: 'This is my second comment')
    @comment3 = Comment.create(author: @user, post: @post, text: 'This is my third comment')
    @like = Like.create(author: @user, post: @post)
  end

  describe 'Post show page' do
    it 'displays the post title' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('The Dark Night')
    end

    it 'displays the post author' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Batman')
    end

    it 'displays the post text' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('This is my first post')
    end

    it 'displays the comments counter' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Comments: 18')
    end

    it 'displays the likes counter' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'displays the user name of each commentor' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('Batman')
    end

    it 'displays the comment text' do
      visit user_post_path(@user, @post.id)
      expect(page).to have_content('This is my first comment')
      expect(page).to have_content('This is my second comment')
      expect(page).to have_content('This is my third comment')
    end
  end
end
