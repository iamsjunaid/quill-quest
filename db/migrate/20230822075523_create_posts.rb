class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    t.string :title
    t.text :text
    t.integer :likes_counter
    t.integer :comments_counter

    t.timestamps
  end
end
