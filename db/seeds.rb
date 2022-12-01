# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create!(name: 'Cruella Deville', email: 'blondeshavemorefun@gmail.com')
@user2 = User.create!(name: 'Oogie Boogie', email: 'grubshavemorefun@gmail.com')
@party1 = MovieParty.create!(movie_title: 'The Godfather', duration: 300, start_time: DateTime.now, movie_id: 238)
@party2 = MovieParty.create!(movie_title: 'Some Like It Hot', duration: 300, start_time: DateTime.now, movie_id: 239)
UserMovieParty.create!(user_id: @user1.id, movie_party_id: @party1.id, status: 0)
UserMovieParty.create!(user_id: @user1.id, movie_party_id: @party2.id, status: 1)
UserMovieParty.create!(user_id: @user2.id, movie_party_id: @party1.id, status: 1)