class Textbook < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300", :thumb => "100x100"}

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	# validates :image, :Title, :Description, presence: true
end
