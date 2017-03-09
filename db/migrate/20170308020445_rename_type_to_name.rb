class RenameTypeToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :catagory, :type, :name
  end
end
