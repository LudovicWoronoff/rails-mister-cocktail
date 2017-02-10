class Ingredient < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :cocktails, through: :doses
  validates :name, presence: {message: "Il manque un nom"}, uniqueness: {message: "L'ingredient existe deja"}
end
