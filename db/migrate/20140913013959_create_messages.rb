class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :to_user_id
      t.integer :from_user_id

      t.timestamps
    end
    add_index :messages, :to_user_id
    add_index :messages, :from_user_id
  end
end
