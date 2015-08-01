class Message < ActiveRecord::Base
  belongs_to :chef
  belongs_to :user
  belongs_to :reservation
  validates :subject, presence: true
  validates :message, presence: true
end
