class AddStatusToInquiry < ActiveRecord::Migration
  def change
    add_reference :inquiries, :status, index: true
  end
end
