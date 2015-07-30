class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password_digest, confirmation: true
  validates :password_digest_confirmation, presence: true


def index

end

end
