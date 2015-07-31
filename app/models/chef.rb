class Chef < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true
  validates_format_of :phone, :with => /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/, message: "bad format ex. 555-555-5555"

  # validates :password_digest#, confirmation: true
  # validates :password_digest_confirmation, presence: true
end
