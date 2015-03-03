class RemoveResponsedDatetimeFromResponse < ActiveRecord::Migration
  def change
    remove_column :responses, :responsed_datetime, :datetime
  end
end
