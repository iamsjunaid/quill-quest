class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 3..25 }
  validates :posts_counter, numericality: { only_integer: true, greater_than: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
