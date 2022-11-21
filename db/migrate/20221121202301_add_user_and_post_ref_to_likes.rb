class AddUserAndPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, null: false, foreign_key: true
    add_reference :likes, :post, null: false, foreign_key: true
    add_index :likes, :author
    add_index :likes, :post
  end
end
