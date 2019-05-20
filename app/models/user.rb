class User < ActiveRecord::Base

  before_validation :downcase_email

  def downcase_email
    if e_mail
      self.e_mail = e_mail.downcase
    end
  end

  def self.authenticate_with_credentials e_mail, password
    small_e_mail = e_mail.downcase.strip
    user = User.find_by(e_mail: small_e_mail)
    if user && user.authenticate(password)
      return user
    end
    nil
  end

  has_secure_password
  validates :e_mail, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :e_mail, uniqueness: true
  validates :password, confirmation: { case_sensitive: false }
  validates :password, length: { minimum: 7 }

end
