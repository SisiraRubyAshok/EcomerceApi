class Product < ApplicationRecord
	has_many :product_carts
	has_many :carts , through: :product_carts
end
