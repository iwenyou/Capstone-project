class RenameTypeToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :groceries, :type, :name
  end
end
