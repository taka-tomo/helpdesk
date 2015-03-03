class Category < ActiveRecord::Base
  has_many :inquiries
end
