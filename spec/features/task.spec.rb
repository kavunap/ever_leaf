# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
    Task.create!(name: 'test_task_02', content: 'samplesample', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "Test task creation" do
    # visit to new_task_path (transition to task registration page)
    visit new_task_path

    # In the input field labeled "Task Name" and in the input field labeled "Task Details"
    # Fill in the task title and content respectively

    fill_in  'Name' ,  with: 'completed' 
    fill_in  'Content' ,  with: 'ruby task' 

    # Click_on a button with a value (notation letter) of “Register”
    click_on  'Create'

    # Check if the information that is supposed to be registered by click is displayed on the task detail page
    # (Assumption that transition to the task details screen will be made if the task is registered)
    expect(page ).to  have_content  'ruby task'
  end

  scenario "Test task details" do

  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
    Task.create!(name: 'test_task_02', content: 'testtesttest2', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019')
    Task.order('created_at')
  end
end