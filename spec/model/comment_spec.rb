require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'updates the comments_counter attribute' do
      user = User.create(name: 'Sam')
      post = Post.create(title: 'Hello', author: user)
      comment = Comment.create(author: user, post:)

      comment.update_comments_counter

      expect(post.reload.comments_counter).to eq(2)
    end
  end
end