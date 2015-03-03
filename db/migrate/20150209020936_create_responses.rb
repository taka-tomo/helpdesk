class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :contents
      t.datetime :responsed_datetime
      t.references :inquiry, index: true

      t.timestamps
    end
  end
end
