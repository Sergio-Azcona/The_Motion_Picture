class Director < ApplicationRecord
  has_many :films
  validates_presence_of :name
  validates_numericality_of :best_director_oscars
  validates :multiple_best_director_nominations, inclusion: [true, false]
  
  def self.last_created
    order(created_at: :desc)
  end

  def film_count
    films.count
  end
  
end