class Product < ApplicationRecord
	validates :name, presence: true, length: { maximum: 100 },
				uniqueness: { case_sensitive: false }
	validates :description, presence: true, length: { maximum: 500 }
	validates :warehouse, presence: true
end
