class RemoveInquiredPersonFromInquiry < ActiveRecord::Migration
  def change
    remove_column :inquiries, :inquired_person, :string
  end
end
