class Grocery < ApplicationRecord
  belongs_to :user
  has_many :categories_groceries
  has_many :catagories, through: :categories_groceries
end
