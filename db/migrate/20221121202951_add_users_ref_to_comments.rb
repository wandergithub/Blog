class AddUsersRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: {on_delete: :nullify}
    add_reference :comments, :post, null: false, foreign_key: {on_delete: :cascade}
  end
end
