require 'rails_helper'

RSpec.describe Film do
  describe 'relationships and validations' do
    it { should belong_to(:director) }

    it { should validate_presence_of :name }
  end
end