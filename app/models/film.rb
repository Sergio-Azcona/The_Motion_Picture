class Film < ApplicationRecord
  belongs_to :director

  validates_presence_of :name
  validates_numericality_of :release_year
  validates :best_picture_oscar, inclusion: [true, false]


  def self.oscar_winners
    where(best_picture_oscar: :true)
  end

  def self.alphabetical_order 
    order(name: :asc)
  end
end