require 'rails_helper'

RSpec.describe 'Create New Director Page' do
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
  
  describe 'User Story 11' do
    it "has a 'New Director' link on the director indext page that takes user to '/directors/new'" do
      visit (directors_path)

      click_link ('Create New Director')

      expect(current_path).to_not eq(films_path)
      expect(current_path).to eq(directors_new_path)
    end

    describe "page has a form for user to fill in directos attributes" do
      describe "page has an 'Add Director' button- which sends user to director index" do
        it "displays the new record to director index page and a successful flash message" do
          visit (directors_new_path)

          fill_in('Name', with: "Sam de Jong")
          fill_in('best_director_oscars', with: '0')
          choose('multiple_best_director_nominations', with: 'false')
          
          click_button('Add Director') 

          expect(current_path).to_not eq(films_path)
          expect(current_path).to eq(directors_path)

          expect(page).to have_content('Sam de Jong')
          expect(page).to have_content('Update Successful')
        end
      end

      xdescribe "if entry is incomplete and user clicks 'Add Director' button - submission is not accepted" do
        it 'send the user back to the create page and allows them to create a new entry for submission' do
          visit (directors_new_path)

          fill_in('Name', with: "Sam de Jong")
          fill_in('best_director_oscars', with: '0')
          choose('multiple_best_director_nominations', with: '')
          
          click_button('Add Director') 

          # expect(current_path).to_not eq(directors_path)
          expect(current_path).to eq(directors_new_path)

          # expect(page).to have_content('Unacceptable Entry - Try Again')
        end
      end
    end

  end
end