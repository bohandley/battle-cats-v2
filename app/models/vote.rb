class Vote < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :pet

	validates :pet_id, presence: true
end