class Book < ApplicationRecord
	validates :title, presence: true
	validates :comment, presence: true,length:{maximum: 200}
	validates :user_id, presence: true

	belongs_to :user, dependent: :destroy
end
