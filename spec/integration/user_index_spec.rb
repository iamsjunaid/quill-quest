require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Batman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Superhero',
                        posts_counter: 10)
  end

  describe 'User index page' do
    before(:each) { visit users_path }

    it 'displays a container for the users' do
      expect(page).to have_css('section.all_users_container')
    end

    it 'displays the username of each user' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays the photos of each user' do
      User.all.each do |user|
        expect(page.has_xpath?("//img[@src = '#{user.photo}' ]"))
      end
    end

    it 'shows the number of posts of each user' do
      User.all.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it "is redirected to that user's show page" do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
