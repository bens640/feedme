class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  validates :first_name, presence: true
<<<<<<< HEAD
  # validates :last_name, presence: true
=======
  validates :last_name, presence: true
>>>>>>> 446b09131a913efa949365fde900ab804e268b66
  validates :email, uniqueness: true, confirmation: true
  # validates :email_confirmation, presence: true
  validates :password_digest, confirmation: true
<<<<<<< HEAD
  # validates :password_digest_confirmation, presence: true
  has_secure_password
=======
  validates :password_digest_confirmation, presence: true


def index

end

>>>>>>> 446b09131a913efa949365fde900ab804e268b66
end
