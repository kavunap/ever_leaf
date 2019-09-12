class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :name, :string, null: false
    change_column :tasks, :content, :text, null: false
    change_column :tasks, :status, :string, null: false
    change_column :tasks, :priority, :string, null: false
    change_column :tasks, :start_date, :date, null: false
    change_column :tasks, :end_date, :date, null: false
  end
end
