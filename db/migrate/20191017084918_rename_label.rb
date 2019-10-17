class RenameLabel < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :label, :labeled
  end
end
