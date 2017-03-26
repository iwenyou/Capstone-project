class Grocery < ApplicationRecord
  belongs_to :user
  has_many :grocery_category
  has_many :catagories, through: :grocery_category

  def days_left
    return (expiration_date - Date.today).to_i
  end

  def self.expiration_date_check(user_id)
    result  = []
    where(user_id: user_id).each do |grocery|
      if grocery.days_left >= 0
        result << grocery
      end
    end
    sorted_result = result.sort_by {|arr| arr["expiration_date"] }
    return sorted_result
  end
end
