class Recipe < ActiveRecord::Base
  has_many :reservations
  validates :title, presence: true
  attr_accessor :image

  mount_uploader :image, RecipeImageUploader # Tells rails to use this uploader for this model.



end
