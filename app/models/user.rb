class User < ApplicationRecord

  has_many :tasks, dependent: :destroy

  #has_many :labels, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  # def is_online?
  #   last_seen_at > 5.minutes.ago
  # end
end
