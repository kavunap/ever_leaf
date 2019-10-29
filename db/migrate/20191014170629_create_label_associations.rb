class CreateLabelAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :label_associations do |t|
      t.references :label, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
