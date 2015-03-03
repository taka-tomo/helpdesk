class Inquiry < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :status
  
  validates :contents, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
end
