require 'rails_helper'

RSpec.describe Director do
  describe 'relationships and validations' do
    it { should have_many(:films) }

    it { should validate_presence_of :name }
    it { should validate_numericality_of :best_director_oscars }
  end
end