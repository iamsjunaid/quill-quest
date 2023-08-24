require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ User.new(name: "John", photo:"https://example.com/photo.jpg", bio:"Example bio", posts_counter: 5) }
  
  before{ subject.save }
    it "is valid with valid name" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
end