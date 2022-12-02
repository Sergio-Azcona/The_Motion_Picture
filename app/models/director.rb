class Director < ApplicationRecord
  has_many :films
  validates_presence_of :name
  validates_numericality_of :best_director_oscars
  
  def self.last_created
    order(created_at: :desc)
  end
  
end