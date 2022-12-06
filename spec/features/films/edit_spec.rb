require 'rails_helper'

RSpec.describe 'Film Edit Page' do
  before(:each) do    
    @s_kubrick = Director.create!(name: 'Stanley Kubrick',best_director_oscars: 0,multiple_best_director_nominations: true)
    @s_spielberg = Director.create!(name: 'Steven Spielberg',best_director_oscars: 2 ,multiple_best_director_nominations: true)

    @clockwork_orange = @s_kubrick.films.create!(name:'A Clockwork Orange', release_year: 1971, best_picture_oscar: false)
    @eyes_wide_shut = @s_kubrick.films.create!(name:'Eyes Wide Shut', release_year: 1999, best_picture_oscar: false)
    @fear_and_desire = @s_kubrick.films.create!(name:'Fear and Desire', release_year: 1952, best_picture_oscar: false)
    
    @firelight = @s_spielberg.films.create!(name:'Firelight', release_year: 1964, best_picture_oscar: false)
    @jurassic_park = @s_spielberg.films.create!(name:"Jurassic Park", release_year: 1993, best_picture_oscar: false)
    @schindlers_list = @s_spielberg.films.create!(name:"Schindler's List", release_year: 1993, best_picture_oscar: true)
  end

  describe 'User Story 14' do
    it "has a 'Update Film' link on the film's show page that takes user to 'directors/director.id/films/new'" do
      visit ("films/#{@clockwork_orange.id}")
      
      click_link ('Update Film')

      expect(current_path).to_not eq(films_path)
      expect(current_path).to eq("/films/#{@clockwork_orange.id}/edit")
    end

    describe "page has a form for user to fill in film's attributes" do
      describe "page has an 'Add film' button-which sends user to director's film index if fully completed" do
        it "displays the new record to director's film index page and a successful flash message" do
          
          visit ("films/#{@clockwork_orange.id}")

          expect(page).to have_content("#{@clockwork_orange.name}")
          expect(page).to_not have_content("Clocks-works-are-orange")
          
          click_link ('Update Film')

          expect(current_path).to eq("/films/#{@clockwork_orange.id}/edit")

          fill_in('Name', with: "Clocks-works-are-orange")
          click_button('Update Film') 

          expect(current_path).to_not eq("/films/new")
          expect(current_path).to_not eq("/films/#{@clockwork_orange.id}/edit")
          expect(current_path).to eq("/films/#{@clockwork_orange.id}")

          expect(page).to have_content("Clocks-works-are-orange")
          expect(page).to have_content('Update Successful')
        end
      end
    end
  end
end

