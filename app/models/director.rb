class Director < ApplicationRecord
  has_many :films
  validates_presence_of :name
  validates_numericality_of :best_director_oscars
end