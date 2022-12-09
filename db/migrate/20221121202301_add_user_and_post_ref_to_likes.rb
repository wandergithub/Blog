class AddUserAndPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: {on_delete: :cascade}
    add_reference :likes, :post, null: false, foreign_key: {on_delete: :cascade}
  end
end
