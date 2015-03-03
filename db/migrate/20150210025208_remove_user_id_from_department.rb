class RemoveUserIdFromDepartment < ActiveRecord::Migration
  def change
    remove_column :departments, :user_id, :integer
  end
end
