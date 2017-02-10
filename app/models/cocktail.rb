class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: {message: "Il manque un nom"}, uniqueness: {message: "Le nom existe deja"}
  mount_uploader :photo, PhotoUploader
end
