class Chef < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, uniqueness: true
  # validates :password_digest, confirmation: true
  # validates :password_digest_confirmation, presence: true
end
