class Product < ApplicationRecord
    validates :product_name, presence: true
    validates :id, presence: true
    validates :id, uniqueness: true
end
