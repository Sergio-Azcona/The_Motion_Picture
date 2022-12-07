require 'rails_helper'

RSpec.describe 'Directors Index Page' do
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
  
    visit (directors_path)
  end

  describe 'User Story 1' do
    it 'page displays the name of each parent record in the system' do
      expect(page).to_not have_content(@true_crime.name)
      expect(page).to_not have_content(@schindlers_list.release_year)
      expect(page).to_not have_content(@hurt_locker.best_picture_oscar)

      expect(page).to have_content(@c_eastwood.name)
      expect(page).to have_content(@k_bigelow.name)
      expect(page).to have_content(@s_kubrick.name)
      expect(page).to have_content(@s_spielberg.name)
    end

    it "sends user to the director's show page when their name is click" do      
      click_on ('Steven Spielberg')
      
      expect(current_path).to_not eq("/films/#{@c_eastwood.id}")
      expect(current_path).to_not eq("/directors/#{@jurassic_park .id}")
      
      expect(current_path).to eq("/directors/#{@s_spielberg.id}")
    end
  end

  describe 'User Story 6' do 
    it "discplays director index sorted by Most Recently Created" do
      expect(@s_spielberg.name).to appear_before(@s_kubrick.name)
      expect(@s_kubrick.name).to appear_before(@k_bigelow.name)
      expect(@k_bigelow.name).to appear_before(@c_eastwood.name)
    end
  end

  describe 'User Story 17, Director Update From Director Index Page' do
    describe 'has a link to edit that director next to every director' do
     it "takes user to that specific director's edit page" do
        
      expect(page).to have_link("#{@s_spielberg.name}")
      expect(page).to have_link("Update Director #{@s_spielberg.name}") 

        within("#director-links-#{@k_bigelow.id}") do
          expect(page).to_not have_link("#{@s_spielberg.name}")
          expect(page).to_not have_link("Update Director #{@s_spielberg.name}")          
        
          expect(page).to have_link("#{@k_bigelow.name}")
          expect(page).to have_link("Update Director #{@k_bigelow.name}")
        end

      click_link("Update Director #{@k_bigelow.name}")

      expect(current_path).to_not eq(directors_path)
      expect(current_path).to_not eq("/directors/#{@s_spielberg.id}/edit")
      expect(current_path).to eq("/directors/#{@k_bigelow.id}/edit")
      end
    end
  end
end