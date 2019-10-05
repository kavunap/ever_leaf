# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    
    User.create!(name: 'kavuna', email: 'kavuna@gmail.com', user_type: 'admin', password: '123456')
    visit users_path
    expect(page).to have_content 'kavuna'

  end

  scenario "Test user creation" do
    User.create!(name: 'kavuna', email: 'kavuna@gmail.com', user_type: 'admin', password: '123456')

    
    visit users_path
    expect(page ).to  have_content  'kavuna'
  end

  scenario "Test user details" do
    @user= User.create!(name: 'kavuna', email: 'kavuna@gmail.com', user_type: 'admin', password: '123456')
    visit user_path(id: @user.id)
    expect(page).to have_content('kavuna@gmail.com')
    expect(page).to have_content('admin')
  end
end