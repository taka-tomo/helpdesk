class Status < ActiveRecord::Base
  has_many :inquiries
end
