class RenameTypeToNameAgian < ActiveRecord::Migration[5.0]
  def change
    rename_column :catagories, :type, :name
  end
end
