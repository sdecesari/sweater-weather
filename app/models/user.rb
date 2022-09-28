class User < ApplicationRecord
  before_create :assign_api_key

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  has_secure_password

  private
  def assign_api_key
    self.api_key = SecureRandom.hex
  end
end 