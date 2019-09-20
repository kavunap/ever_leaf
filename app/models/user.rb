class User < ApplicationRecord
    has_secure_password
  
    attr_accessible :name, :email, :user_type, :password, :password_confirmation
      
    validates_uniqueness_of :email
end
