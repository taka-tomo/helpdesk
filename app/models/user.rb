class User < ActiveRecord::Base
  belongs_to :department
  has_many :inquiries
  has_many :responses
  
  before_save { self.code = code.downcase }
  before_create :create_remember_token
  
  validates :name, presence: true
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  VALID_TEL_REGEX = /[\d\-]+/
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }
  
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
  
end
