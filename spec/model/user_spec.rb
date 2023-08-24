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
end
