class Warehouse < ApplicationRecord
	validates :name, presence: true, length: { maximum: 500 },
				uniqueness: { case_sensitive: true }
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :phone, presence: true
end
