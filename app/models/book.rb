class Book < ApplicationRecord
	validates :title, presence: true
	validates :comment, presence: true

	belongs_to :user, dependent: :destroy
end
