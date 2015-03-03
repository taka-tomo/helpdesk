class AddCategoryToInquiries < ActiveRecord::Migration
  def change
    add_reference :inquiries, :category, index: true
  end
end
