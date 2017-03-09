class Grocery < ApplicationRecord
  belongs_to :user
  has_many :grocery_category
  has_many :catagories, through: :grocery_category
end
