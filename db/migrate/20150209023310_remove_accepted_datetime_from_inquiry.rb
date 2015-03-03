class RemoveAcceptedDatetimeFromInquiry < ActiveRecord::Migration
  def change
    remove_column :inquiries, :accepted_datetime, :datetime
  end
end
