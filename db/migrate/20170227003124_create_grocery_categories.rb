class CreateGroceryCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :grocery_categories do |t|
      t.integer :grocery_id
      t.integer :catagory_id

      t.timestamps
    end
  end
end
