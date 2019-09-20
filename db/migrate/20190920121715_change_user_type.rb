class ChangeUserType < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_type, :string, default: 'user'
  end
end
