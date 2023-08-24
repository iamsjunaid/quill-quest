require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Example bio', posts_counter: 5) }

  before { subject.save }
  describe '#name' do
    context 'when name is nil' do
      it 'returns false without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    context 'when name is empty' do
      it 'returns false without a name' do
        subject.name = ''
        expect(subject).to_not be_valid
      end
    end

    context 'when name is valid' do
      it 'returns true' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#posts_counter' do
    context 'when posts_counter is not numeric' do
      it 'returns false' do
        subject.posts_counter = 'not_numeric'
        expect(subject).to_not be_an_instance_of(Numeric)
      end
    end

    context 'when posts_counter is nil' do
      it 'returns false without a posts_counter' do
        subject.posts_counter = nil
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is empty' do
      it 'returns false without a posts_counter' do
        subject.posts_counter = ''
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is negative' do
      it 'returns false without a posts_counter' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is positive' do
      it 'returns true' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do

      user = User.create(name: 'Junaid')
      post1 = Post.create(title: 'post1', author: user, created_at: 4.day.ago)
      post2 = Post.create(title: 'post2', author: user, created_at: 3.day.ago)
      post3 = Post.create(title: 'post3', author: user, created_at: 2.day.ago)

      recent_posts = user.recent_posts

      expect(recent_posts).to eq(user.posts.order(created_at: :desc).limit(3))
    end
  end
end
