class Restaurant < ActiveRecord::Base
	has_many :dishes
	has_many :opening_hours
	belongs_to :food_style
	belongs_to :building
end
