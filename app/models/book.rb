class Book < ApplicationRecord
	validates :title, presence: true
	validates :comment, presence: true
end
