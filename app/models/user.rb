class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :password_digest, confirmation: true
  validates :password_digest_confirmation, presence: true


def index

end

end
