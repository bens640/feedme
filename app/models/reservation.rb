class Reservation < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  belongs_to :chef
  validates :time, :address, :city, :state, :zip, :phone, presence: true
  has_many :messages, dependent: :destroy
  after_initialize :init
  # def self.info
  #   Hash[*Reservation.available.all.map{|b| [b.user.first_name, b.user.city]}.flatten]
  # end
  # def self.available
  #   where(chef_id:nil).order('date ASC')
  # end
  scope :available, ->{
      where(chef_id:nil).
      where(canceled:false).
      where('date > ?', Date.yesterday).
      order('date ASC').
      includes(:recipe, :user)}

  scope :chef, ->(chef) {
      where(chef_id:chef.id).
      where(canceled:false).
      where('date > ?', Date.yesterday).
      order('date ASC').
      includes(:recipe, :user)}

  scope :user, ->(user) {
      where(user_id:user.id).
      where(canceled:false).
      where('date > ?', Date.yesterday).
      order('date ASC').
      includes(:recipe, :user)}

  scope :user_old, ->(user) {
      where(user_id:user.id).
      where(canceled:false).
      where('date < ?', Date.today).
      order('date DESC').
      includes(:recipe, :user)}

  scope :chef_old, ->(chef) {
      where(chef_id:chef.id).
      where(canceled:false).
      where('date < ?', Date.today).
      order('date DESC').
      includes(:recipe, :user)}

  # def self.is_nil_or_user_or_chef(current_chef, current_user,params)
  #   find(params).chef_id == nil || Reservation.find(params).user_id == current_user.id || Reservation.find(params).chef_id == current_chef.id
  # end









  # scope :past, ->(user) { where(user_id:user.id).}
  # scope :chef_reservations, ->(chef) { where(chef_id:chef.id).order('date ASC').includes(:recipe, :user)}
  # scope :user_reservations, ->(user) { where(user_id:user.id).order('date ASC').includes(:recipe, :user)}

  # scope :created_before, ->(time) { where("cr eated_at < ?", time) }
  # def self.chef(chef)
  #   where(chef_id:chef).order('date ASC')
  # end
  # def self.user(user)
  #   where(user_id:user).order('date ASC')
  # end
  LIST_TIME= %w[10:00am 11:00am 12:00pm
              1:00pm 2:00pm 3:00pm 4:00pm 5:00pm 6:00pm 7:00pm 8:00pm 9:00pm 10:00pm]
  PLATE_NUMS= [1,2,3,4,5,6,7,8]
  # def self.user_reservations(user)
  #   where(user_id:user.id).includes(:recipe, :user)
  # end
  # def self.chef_reservations(chef)
  #   chef(chef.id).includes(:recipe)
  # end
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  #scope :recent, where('created_at < ?', 3.days.ago)
  def init
    self.closed  = false if (self.has_attribute? :closed) && self.closed.nil?          #will set the default value only if it's nil
    self.canceled = false if (self.has_attribute? :canceled) && self.canceled.nil?
  end
end
