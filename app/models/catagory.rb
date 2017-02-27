class Catagory < ApplicationRecord
  has_many :grocery_category
  has_many :groceries, through: :grocery_category
end
