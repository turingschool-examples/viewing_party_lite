# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: "Pabu", email: "pabu@pabu.com")
user2 = User.create(name: "Loki", email: "loki@loki.com")
user3 = User.create(name: "Thor", email: "thor@thor.com")
user4 = User.create(name: Faker::JapaneseMedia::OnePiece.character ,email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
user5 = User.create(name: Faker::JapaneseMedia::SwordArtOnline.real_name ,email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")

#viewing_party1 = ViewingParty.create(movie_id: 1, date: 2022-07-06, start_time: ,duration: 180)
