class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.datetime :accepted_datetime
      t.string :inquired_person
      t.text :contents

      t.timestamps
    end
  end
end
