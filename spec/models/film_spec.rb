require 'rails_helper'

RSpec.describe Film do
  describe 'relationships and validations' do
    it { should belong_to(:director) }

    it { should validate_presence_of :name }
  end

  before(:each) do 
    @c_eastwood = Director.create!(name: 'Clint Eastwood',best_director_oscars: 2 ,multiple_best_director_nominations: true, created_at: Time.now - 400.hours)
    @k_bigelow = Director.create!(name: 'Kathryn Bigelow',best_director_oscars: 1,multiple_best_director_nominations: false, created_at: 6.hours.ago)
    @s_kubrick = Director.create!(name: 'Stanley Kubrick',best_director_oscars: 0,multiple_best_director_nominations: true, created_at: 20.seconds.ago)
    
    @million_dollar_baby = @c_eastwood.films.create!(name:'Million Dollar Baby', release_year: 2004, best_picture_oscar: true)
    @perfect_world = @c_eastwood.films.create!(name:'A Perfect World', release_year: 1993, best_picture_oscar: false)
    @unforgiven = @c_eastwood.films.create!(name:'Unforgiven', release_year: 1992, best_picture_oscar: true)
    
    @hurt_locker = @k_bigelow.films.create!(name:'The Hurt Locker', release_year: 2008, best_picture_oscar: true)
    @zero_dark_thirty = @k_bigelow.films.create!(name:'Zero Dark Thirty', release_year: 2012, best_picture_oscar: false)
    
    @clockwork_orange = @s_kubrick.films.create!(name:'A Clockwork Orange', release_year: 1971, best_picture_oscar: false)
    @eyes_wide_shut = @s_kubrick.films.create!(name:'Eyes Wide Shut', release_year: 1999, best_picture_oscar: false)
  end

  describe 'Story 15-returns only oscar winners' do
    it "returns records where the boolean column (best_picture_oscar) is 'true'" do
      expect(Film.oscar_winners).to_not eq([@clockwork_orange,@zero_dark_thirty,@perfect_world])
      expect(Film.oscar_winners).to_not eq([@million_dollar_baby,@unforgiven,@hurt_locker,@eyes_wide_shut,])
      expect(Film.oscar_winners).to eq([@million_dollar_baby,@unforgiven,@hurt_locker])
    end
  end

  # describe 'User Story 16-Sort Alphabetical Order by name' do
  #   it 'returns records  ordered in alphabetical order' do
  #     expect(Film.alphabetical_order).to_not eq([@zero_dark_thirty,@unforgiven,@hurt_locker,@million_dollar_baby,@eyes_wide_shut,@perfect_world,@clockwork_orange])
  #     expect(Film.alphabetical_order).to_not eq([@clockwork_orange,@perfect_world,@zero_dark_thirty,@unforgiven,@hurt_locker,@million_dollar_baby,@eyes_wide_shut])
  #     expect(Film.alphabetical_order).to_not eq([@clockwork_orange,@perfect_world,@eyes_wide_shut])
     
  #     expect(Film.alphabetical_order).to eq([@clockwork_orange,@perfect_world,@eyes_wide_shut,@million_dollar_baby,@hurt_locker,@unforgiven,@zero_dark_thirty])
  #   end
  # end

 

end


