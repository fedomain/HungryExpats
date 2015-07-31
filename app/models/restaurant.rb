class Restaurant < ActiveRecord::Base
	has_many :dishes
	has_many :opening_hours
	has_many :orders
	belongs_to :food_style
	belongs_to :building
end
