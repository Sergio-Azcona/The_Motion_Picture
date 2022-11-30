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

unforgiven = c_eastwood.films.create!(name:'Unforgiven', release_year: 1992, best_picture_oscar: true)
million_dollar_baby = c_eastwood.films.create!(name:'Million Dollar Baby', release_year: 2004, best_picture_oscar: true)
mystic_river = c_eastwood.films.create!(name:'Mystic River', release_year: 2003, best_picture_oscar: false)
bright_star = j_campion.films.create!(name:'Bright Star', release_year: 2009, best_picture_oscar: false)
power_of_dogs = j_campion.films.create!(name:'The Power of the Dog', release_year: 2021, best_picture_oscar: false)
baby_boy = j_singleton.films.create!(name:'Baby Boy', release_year: 2001, best_picture_oscar: false)
boyz_n_the_hood = j_singleton.films.create!(name:'Boyz n the Hood', release_year: 1991, best_picture_oscar: false )
hurt_locker = k_bigelow.films.create!(name:'The Hurt Locker', release_year: 2008, best_picture_oscar: true)
zero_dark_thirty = k_bigelow.films.create!(name:'Zero Dark Thirty', release_year: 2012, best_picture_oscar: false)
clockwork_orange = s_kubrick.films.create!(name:'A Clockwork Orange', release_year: 1971, best_picture_oscar: false)
space_odyssey = s_kubrick.films.create!(name:'2001: A Space Odyssey ', release_year: 1968, best_picture_oscar: false)
e_t = s_spielberg.films.create!(name:'E.T. the Extra-Terrestrial', release_year: 1982, best_picture_oscar: false)
schindlers_list = s_spielberg.films.create!(name:"Schindler's List", release_year: 1993, best_picture_oscar: true)
