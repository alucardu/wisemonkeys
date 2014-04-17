class Competition < ActiveRecord::Base
	validates_presence_of :title, :description, :prize, :deadline, :deadline_signin
	has_many :pictures
	belongs_to :user
	validates_presence_of :title, :description, :prize
end
