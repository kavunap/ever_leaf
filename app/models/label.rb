class Label < ApplicationRecord
  belongs_to :user
  #has_and_belongs_to_many :tasks
  #belongs_to :task
  has_many :label_associations
  has_many :tasks, through: :label_associations

end
