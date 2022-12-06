class Film < ApplicationRecord
  belongs_to :director

  validates_presence_of :name
  validates_numericality_of :release_year
  validates :best_picture_oscar, inclusion: [true, false]

end