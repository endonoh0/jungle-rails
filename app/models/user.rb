class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
