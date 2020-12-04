class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :categories
  validates :name, presence:true
end
