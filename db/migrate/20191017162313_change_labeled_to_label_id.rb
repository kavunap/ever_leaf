class ChangeLabeledToLabelId < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :labeled, :label_id
  end
end
