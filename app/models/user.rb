class User < ApplicationRecord
  has_many :comments, class: "Comment", foreign_key: "author_id"
  has_many :posts, class: "Post", foreign_key: "author_id"
  has_many :likes, class: "Like", foreign_key: "author_id"
end