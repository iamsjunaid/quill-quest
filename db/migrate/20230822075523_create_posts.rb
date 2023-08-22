class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    t.references :author_id, foreign_key: { to_table: :users }
    t.string :title
    t.text :text
    t.integer :comments_counter, default: 0
    t.integer :likes_counter, default: 0
    
    t.timestamps
  end
end
