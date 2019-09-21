class Task < ApplicationRecord
  belongs_to :user
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true
  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("status ILIKE ?", "%#{search}%")
    
  end
  paginates_per 2
  #belongs_to :user
  def self.order_list(sort_order)
    if sort_order == "name"
      order(name: :desc)
    elsif sort_order == "end_date"
      order(end_date: :desc)
    elsif sort_order == "priority"
      order(priority: :asc)
    else
      order(start_date: :desc)
    end
  end
end
