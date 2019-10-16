class LabelAssociation < ApplicationRecord
  belongs_to :label
  belongs_to :task
  validates_presence_of :label_id
  validates_presence_of :task_id
  accepts_nested_attributes_for :label
end
