class AddLabelToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :label, foreign_key: true
  end
end
