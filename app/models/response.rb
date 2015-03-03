class Response < ActiveRecord::Base
  belongs_to :inquiry
  belongs_to :user
  
  validates :contents, presence: true
end
