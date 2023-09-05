require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
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

  scenario "see user's profile picture, username, number of posts and interactions" do
    visit user_posts_path(user_id: @user.id)
    expect(page).to have_content('Batman')
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    expect(page).to have_content('Number of posts: 7')
    expect(page).to have_content('Comments: 18')
    expect(page).to have_content('Likes: 19')
  end

  scenario "see some of the post's title, body and first comments" do
    visit user_posts_path(user_id: @user.id)
    expect(page).to have_content('This is my first post')
  end

  scenario 'see a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(user_id: @user.id)
    expect(page).to have_content('Pagination')
  end

  scenario "clicking on a post, it redirects me to that post's show page" do
    visit user_posts_path(user_id: @user.id)
    click_link 'Post #'
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
