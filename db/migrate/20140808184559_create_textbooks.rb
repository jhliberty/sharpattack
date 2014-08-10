class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :Title
      t.text :Description

      t.timestamps
    end
  end
end
