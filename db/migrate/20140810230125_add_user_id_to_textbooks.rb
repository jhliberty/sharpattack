class AddUserIdToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :user_id, :inter
    add_index :textbooks, :user_id
  end
end
