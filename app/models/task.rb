class Task < ApplicationRecord
  belongs_to :user

  #has_many :labels
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true
  def self.search(search,search1,search2)
    if search
    # Title is for the above case, the OP incorrectly had 'name'
    where("status ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}%")
    elsif search1
      where("status ILIKE ?", "%#{search1}%")
    elsif search2
        where("name ILIKE ?", "%#{search2}%")
    else
      order('created_at desc')
    end
    
  end
  paginates_per 2
  #belongs_to :user
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
  #scope :latest, -> (number = 4){order(created_at: :desc).limit(number)}
end
