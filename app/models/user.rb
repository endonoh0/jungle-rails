class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
