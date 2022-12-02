# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
c_eastwood = Director.create!(name: 'Clint Eastwood',best_director_oscars: 2 ,multiple_best_director_nominations: true)
j_campion = Director.create!(name: 'Jane Campion',best_director_oscars: 1,multiple_best_director_nominations: true)
j_singleton = Director.create!(name: 'John Singleton',best_director_oscars: 0,multiple_best_director_nominations: false)
k_bigelow = Director.create!(name: 'Kathryn Bigelow',best_director_oscars: 1,multiple_best_director_nominations: false)
s_kubrick = Director.create!(name: 'Stanley Kubrick',best_director_oscars: 0,multiple_best_director_nominations: true)
s_spielberg = Director.create!(name: 'Steven Spielberg',best_director_oscars: 2 ,multiple_best_director_nominations: true)

american_sniper= c_eastwood.films.create!(name:'American Sniper', release_year: 2014, best_picture_oscar: false)
gran_torino = c_eastwood.films.create!(name:'Gran Torino', release_year: 2008, best_picture_oscar: false)
million_dollar_baby = c_eastwood.films.create!(name:'Million Dollar Baby', release_year: 2004, best_picture_oscar: true)
mystic_river = c_eastwood.films.create!(name:'Mystic River', release_year: 2003, best_picture_oscar: false)
perfect_world = c_eastwood.films.create!(name:'A Perfect World', release_year: 1993, best_picture_oscar: false)
play_misty_for_me = c_eastwood.films.create!(name:'Play Misty for Me', release_year: 1971, best_picture_oscar: false)
true_crime = c_eastwood.films.create!(name:'True Crime', release_year: 1999, best_picture_oscar: false)
unforgiven = c_eastwood.films.create!(name:'Unforgiven', release_year: 1992, best_picture_oscar: true)

bright_star = j_campion.films.create!(name:'Bright Star', release_year: 2009, best_picture_oscar: false)
in_the_cut = j_campion.films.create!(name:'In the Cut', release_year: 2003, best_picture_oscar: false)
holy_smoke = j_campion.films.create!(name:'Holy Smoke!', release_year: 1999, best_picture_oscar: false)
power_of_dogs = j_campion.films.create!(name:'The Power of the Dog', release_year: 2021, best_picture_oscar: false)
sweetie = j_campion.films.create!(name:'Sweetie', release_year: 1989, best_picture_oscar: false)

abduction = j_singleton.films.create!(name:'Abduction', release_year: 2011, best_picture_oscar: false)
baby_boy = j_singleton.films.create!(name:'Baby Boy', release_year: 2001, best_picture_oscar: false)
boyz_n_the_hood = j_singleton.films.create!(name:'Boyz n the Hood', release_year: 1991, best_picture_oscar: false )
fast_furious_2 = j_singleton.films.create!(name:'2 Fast 2 Furious', release_year: 2003, best_picture_oscar: false )
poetic_justice = j_singleton.films.create!(name:'Poetic Justice', release_year: 1993, best_picture_oscar: false )

detroit = k_bigelow.films.create!(name:'Detroit', release_year: 2017, best_picture_oscar: false)
hurt_locker = k_bigelow.films.create!(name:'The Hurt Locker', release_year: 2008, best_picture_oscar: true)
loveless = k_bigelow.films.create!(name:'The Loveless', release_year: 1981, best_picture_oscar: false)
zero_dark_thirty = k_bigelow.films.create!(name:'Zero Dark Thirty', release_year: 2012, best_picture_oscar: false)

clockwork_orange = s_kubrick.films.create!(name:'A Clockwork Orange', release_year: 1971, best_picture_oscar: false)
dr_Strangelove = s_kubrick.films.create!(name:'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', release_year: 1964, best_picture_oscar: false)
eyes_wide_shut = s_kubrick.films.create!(name:'Eyes Wide Shut', release_year: 1999, best_picture_oscar: false)
fear_and_desire = s_kubrick.films.create!(name:'Fear and Desire', release_year: 1952, best_picture_oscar: false)
full_metal_jacket = s_kubrick.films.create!(name:'Full Metal Jacket', release_year: 1987, best_picture_oscar: false)
killing = s_kubrick.films.create!(name:'The Killing', release_year: 1956, best_picture_oscar: false)
space_odyssey = s_kubrick.films.create!(name:'2001: A Space Odyssey', release_year: 1968, best_picture_oscar: false)

close_encounters= s_spielberg.films.create!(name:'Close Encounters of the Third Kind', release_year: 1977 , best_picture_oscar: false)
e_t = s_spielberg.films.create!(name:'E.T. the Extra-Terrestrial', release_year: 1982, best_picture_oscar: false)
fabelmans = s_spielberg.films.create!(name:'The Fabelmans', release_year: 2022, best_picture_oscar: false)
firelight = s_spielberg.films.create!(name:'Firelight', release_year: 1964, best_picture_oscar: false)
indiana_jones_last_crusade = s_spielberg.films.create!(name:'Indiana Jones and the Last Crusade', release_year: 1989, best_picture_oscar: false)
jaws = s_spielberg.films.create!(name:'Jaws', release_year: 1975, best_picture_oscar: false)
jurassic_park = s_spielberg.films.create!(name:"Jurassic Park", release_year: 1993, best_picture_oscar: false)
saving_private_ryan= s_spielberg.films.create!(name:'Saving Private Ryan', release_year: 1998, best_picture_oscar: false)
schindlers_list = s_spielberg.films.create!(name:"Schindler's List", release_year: 1993, best_picture_oscar: true)