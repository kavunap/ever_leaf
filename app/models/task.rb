class Task < ApplicationRecord
  #belongs_to :user
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true
end
