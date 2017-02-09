class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: {message: "Il manque une description"}
  validates_uniqueness_of :cocktail, :scope => [:ingredient]
end
