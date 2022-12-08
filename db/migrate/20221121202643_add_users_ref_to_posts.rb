class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: {on_delete: :nullify}
  end
end
