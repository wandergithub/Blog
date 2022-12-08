class ChangePostsCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :PostsCounter, :integer, default: 0
    end
  end
end
