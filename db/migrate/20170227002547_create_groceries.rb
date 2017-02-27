class CreateGroceries < ActiveRecord::Migration[5.0]
  def change
    create_table :groceries do |t|
      t.string :name
      t.integer :user_id
      t.date :made_by
      t.date :expiration_date
      t.boolean :status

      t.timestamps
    end
  end
end
