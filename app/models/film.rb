class Film < ApplicationRecord
  belongs_to :director

  validates_presence_of :name
end