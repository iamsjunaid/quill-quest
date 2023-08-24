require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Example bio', posts_counter: 5) }

  before { subject.save }
  describe '#name' do
    context 'when name is nil' do
      it 'returns not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    context 'when name is empty' do
      it 'returns not valid without a name' do
        subject.name = ''
        expect(subject).to_not be_valid
      end
    end

    context 'when name is valid' do
      it 'returns valid' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#posts_counter' do
    context 'when posts_counter is nil' do
      it 'returns not valid without a posts_counter' do
        subject.posts_counter = nil
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is empty' do
      it 'returns not valid without a posts_counter' do
        subject.posts_counter = ''
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is negative' do
      it 'returns not valid without a posts_counter' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
      end
    end

    context 'when posts_counter is positive' do
      it 'returns valid' do
        expect(subject).to be_valid
      end
    end
  end
end
