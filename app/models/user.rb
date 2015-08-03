class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  has_many :messages

  validates :first_name, :last_name, presence: true

  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
            uniqueness: true

  validates :phone,
            format: {with: /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/,
                     message: "bad format ex. 555-555-5555"},
            allow_nil: true
  # validates :password_digest, confirmation: true
  # validates :password_digest_confirmation, presence: true
end
