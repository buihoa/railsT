class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.user.name}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true,
  length: {minimum: Settings.user.password_min}

  def self.digest string
    if cost == ActiveModel::SecurePassword.min_cost
      cost = BCrypt::Engine::MIN_COST
    else
      cost BCrypt::Engine.cost
    end

    BCrypt::Password.create(string, cost: cost)
  end

  private
  def before_save
    self.email.downcase!
  end
end
