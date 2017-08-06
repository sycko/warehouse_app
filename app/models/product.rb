class Product < ApplicationRecord
	validates :name, presence: true, length: { maximum: 100 },
				uniqueness: { case_sensitive: true }
	validates :description, presence: true, length: { maximum: 500 }
	validates :warehouses_id, presence: true
end
