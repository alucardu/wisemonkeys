class Competition < ActiveRecord::Base
	has_many :pictures
	belongs_to :user
	validates_presence_of :title, :description, :prize
end
