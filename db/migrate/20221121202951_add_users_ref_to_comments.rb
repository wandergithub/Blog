class AddUsersRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
    add_index :comments, :author
    add_index :comments, :post
  end
end
