class ChangeTaskEndDateToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :end_date, :datetime, null: false
  end
end
