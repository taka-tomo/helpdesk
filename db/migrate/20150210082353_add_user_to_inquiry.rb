class AddUserToInquiry < ActiveRecord::Migration
  def change
    add_reference :inquiries, :user, index: true
  end
end
