class Task < ApplicationRecord
  belongs_to :user

 
  has_and_belongs_to_many :labels
  
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true

  
  
  paginates_per 2
 
  def self.order_list(sort_order)
    if sort_order == "created_at"
      order(created_at: :desc)
    elsif sort_order == "end_date"
      order(end_date: :desc)
    elsif sort_order == "priority"
      order(priority: :asc)
    else
      order(start_date: :desc)
    end
  end
 
end
