class AddIndexToUsersCode < ActiveRecord::Migration
  def change
    add_index :users, :code, unique: true
  end
end
