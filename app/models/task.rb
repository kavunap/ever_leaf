class Task < ApplicationRecord
  belongs_to :user
  #has_and_belongs_to_many :labels
  # has_many :label_associations
  # # accepts_nested_attributes_for :labels
  has_many :tasks_labels
  has_many :labels, :through => :tasks_labels

  accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a| 
     a['label_id'].blank? }
  accepts_nested_attributes_for :labels
  validates :name, :content, :status, :priority, :start_date, :end_date, presence: true
  #validates_presence_of :label_id
  def self.search(term,term1,term2)
    if term
      where('name LIKE ?', "%#{term}%")
    elsif term1
      where('name LIKE ?', "%#{term1}%")
    elsif term2
      where('name LIKE ?', "%#{term2}%")
    else
      order('id desc')
    end
  end
  
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

  before_save do
    self.label.gsub!(/[\[\]\"]/,"") if attribute_present? ("label")
  end
 
end
