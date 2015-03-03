class AddUserToDepartment < ActiveRecord::Migration
  def change
    add_reference :departments, :user, index: true
  end
end
