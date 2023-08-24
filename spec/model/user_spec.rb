require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ User.new(name: "Example User", photo:"https://example.com/photo.jpg", bio:"Example bio", posts_counter: 0) }
  
  before{ subject.save }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
end