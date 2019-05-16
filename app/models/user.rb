class User < ApplicationRecord
  validates :name, presence: true, length: {Settings.user.name}
  validates :email, presence: true, length: {Settings.user.email},
    format: {with: Settings.user.validate_email_rex},
    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {Settings.password_min}

  private 
    def before_save
      self.email = email.downcase
    end
end
