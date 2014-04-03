class Picture < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates_presence_of :title, :image, :description
	belongs_to :competition
	has_many :votes, dependent: :destroy
end
