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
    it "has a link on the director show page that sends users to the edit page for that director" do
      visit ("directors/#{@s_spielberg.id}")

      click_link ('Update Director')

      expect(current_path).to_not eq(directors_new_path)
      expect(current_path).to_not eq("/directors/#{@s_kubrick.id}/edit")
      expect(current_path).to eq("/directors/#{@s_spielberg.id}/edit")
    end

    describe "edit page has a form to update directors info and 'Update Director' option to execute the changes" do
      describe "allows user to edit the attribute fields and hit 'Update Director', which returns to the director show page" do
    
        it "displays the director's existing attribute values prefilled on the edit page" do

          visit ("/directors/#{@s_spielberg.id}/edit")

          expect(page).to_not have_content(@s_kubrick.name)
          expect(page).to_not have_content(@k_bigelow.best_director_oscars)
        
          expect(page).to have_content("Edit #{@s_spielberg.name}")
          expect(page).to have_field(:name, :with => "#{@s_spielberg.name}")
          expect(page).to have_field(:best_director_oscars, :with => "#{@s_spielberg.best_director_oscars}")
          expect(page).to have_field(:multiple_best_director_nominations, :with => "#{@s_spielberg.multiple_best_director_nominations}")
        end

        it "displays the edits the user made in the edit screen on the show page after clicking 'Update Director'" do
          visit ("/directors/#{@s_spielberg.id}")

          expect(page).to_not have_content("Number of Best Director Oscars: 5")
          expect(page).to have_content("Number of Best Director Oscars: 2")

          click_link ('Update Director')

          expect(current_path).to eq("/directors/#{@s_spielberg.id}/edit")

          expect(page).to have_field(:best_director_oscars, :with => "2")

          fill_in('best_director_oscars', with: '5')

          click_button('Update Director') 

          expect(current_path).to_not eq(directors_path)
          expect(current_path).to eq("/directors/#{@s_spielberg.id}")
        
          expect(page).to_not have_field("Number of Best Director Oscars: 2")
          expect(page).to have_content("Number of Best Director Oscars: 5")
          expect(page).to have_content("Update Successful")
        end 
      end
    end
  end

end