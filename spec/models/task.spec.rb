require 'rails_helper'
RSpec.describe Task, type: :model do
  it "Validation does not pass if any field is missing the value" do
   task = Task.new(name: 'kavuna', content: 'Failure test')
   expect(task).not_to be_valid
  end

  # # it "validation passes If all field are described" do
  # #   task = Task.new(name: 'test_task_01', content: 'testtesttest', status: 'completed', priority: 'medium',start_date: '10.2.2019', end_date: '20.10.2019', user_id: 1)
  # #   expect(task).to be_valid
  # end
  scenario "test task search" do
    Task.all.where('status LIKE ? or name LIKE ?')
  end
end