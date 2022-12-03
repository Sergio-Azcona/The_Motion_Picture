require 'rails_helper'

RSpec.describe Director do
  describe 'relationships and validations' do
    it { should have_many(:films) }

    it { should validate_presence_of :name }
    it { should allow_value(true).for :multiple_best_director_nominations  }
    it { should allow_value(false).for :multiple_best_director_nominations  }
    # it { should validate :multiple_best_director_nominations }
    it { should validate_numericality_of :best_director_oscars }
  end

  before(:each) do 
    @c_eastwood = Director.create!(name: 'Clint Eastwood',best_director_oscars: 2 ,multiple_best_director_nominations: true, created_at: Time.now - 400.hours)
    @k_bigelow = Director.create!(name: 'Kathryn Bigelow',best_director_oscars: 1,multiple_best_director_nominations: false, created_at: 6.hours.ago)
    @s_kubrick = Director.create!(name: 'Stanley Kubrick',best_director_oscars: 0,multiple_best_director_nominations: true, created_at: 20.seconds.ago)
    
    @million_dollar_baby = @c_eastwood.films.create!(name:'Million Dollar Baby', release_year: 2004, best_picture_oscar: true)
    @mystic_river = @c_eastwood.films.create!(name:'Mystic River', release_year: 2003, best_picture_oscar: false)
    @perfect_world = @c_eastwood.films.create!(name:'A Perfect World', release_year: 1993, best_picture_oscar: false)
    @true_crime = @c_eastwood.films.create!(name:'True Crime', release_year: 1999, best_picture_oscar: false)
    @unforgiven = @c_eastwood.films.create!(name:'Unforgiven', release_year: 1992, best_picture_oscar: true)
    
    @hurt_locker = @k_bigelow.films.create!(name:'The Hurt Locker', release_year: 2008, best_picture_oscar: true)
    @loveless = @k_bigelow.films.create!(name:'The Loveless', release_year: 1981, best_picture_oscar: false)
    @zero_dark_thirty = @k_bigelow.films.create!(name:'Zero Dark Thirty', release_year: 2012, best_picture_oscar: false)
    
    @clockwork_orange = @s_kubrick.films.create!(name:'A Clockwork Orange', release_year: 1971, best_picture_oscar: false)
    @eyes_wide_shut = @s_kubrick.films.create!(name:'Eyes Wide Shut', release_year: 1999, best_picture_oscar: false)
    @fear_and_desire = @s_kubrick.films.create!(name:'Fear and Desire', release_year: 1952, best_picture_oscar: false)
  end

  describe 'User Story 6' do
    it 'returns records  ordered by most recently created first (i.e. created_at in decending order)' do
      expect(Director.last_created).to_not eq([@s_kubrick,@c_eastwood,@k_bigelow,@c_eastwood])
      expect(Director.last_created).to eq([@s_kubrick,@k_bigelow,@c_eastwood])
    end
  end

  describe 'User Story 7, Parent Child Count' do
    it 'displays the count/number of films associated with this director' do
      expect(@s_kubrick.film_count).to_not eq 5
      expect(@c_eastwood.film_count).to_not eq 3
      
      expect(@s_kubrick.film_count).to eq 3
      expect(@c_eastwood.film_count).to eq 5
    end

  end
    
end