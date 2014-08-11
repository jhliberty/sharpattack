class AddAttachmentImageToTextbooks < ActiveRecord::Migration
  def self.up
    change_table :textbooks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :textbooks, :image
  end
end
