class ChangeTaskLabelToArray < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :labeled, "varchar[] USING (string_to_array(labeled, ','))"
  end
end
