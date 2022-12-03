require 'rails_helper'

RSpec.describe 'Edit Existing Director Page' do
  before(:each) do 
    @c_eastwood = Director.create!(name: 'Clint Eastwood',best_director_oscars: 2 ,multiple_best_director_nominations: true, created_at: Time.now - 400.hours)
    @k_bigelow = Director.create!(name: 'Kathryn Bigelow',best_director_oscars: 1,multiple_best_director_nominations: false, created_at: 6.hours.ago)
    @s_kubrick = Director.create!(name: 'Stanley Kubrick',best_director_oscars: 0,multiple_best_director_nominations: true, created_at: 6.hours.ago)
    @s_spielberg = Director.create!(name: 'Steven Spielberg',best_director_oscars: 2 ,multiple_best_director_nominations: true)
    
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
    
    @firelight = @s_spielberg.films.create!(name:'Firelight', release_year: 1964, best_picture_oscar: false)
    @jurassic_park = @s_spielberg.films.create!(name:"Jurassic Park", release_year: 1993, best_picture_oscar: false)
    @schindlers_list = @s_spielberg.films.create!(name:"Schindler's List", release_year: 1993, best_picture_oscar: true)
  end
  
  describe 'User Story 12' do
    describe 'show page has a link to make edits' do
      it 'sends users to the edit page where existing values are prefilled' do
        visit ("directors/#{@s_spielberg.id}")

        click_link ('Update Director')
  
        expect(current_path).to_not eq(directors_new_path)
        expect(current_path).to eq("/directors/#{@s_spielberg.id}/edit")
      end

    end

    xdescribe "edit page has a form for user to update directos attributes" do
      describe "page has an 'Update Director' button- which reflects the updates on the director show page" do
        it 'displays the edits on the show page' do
        end
      end
    end
  end

end