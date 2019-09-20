class Task < ApplicationRecord
  #belongs_to :user
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true
  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("status ILIKE ?", "%#{search}%")
    
  end
  paginates_per 2
  #belongs_to :user
end
