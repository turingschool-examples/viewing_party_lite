# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
        
user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")
user3 = User.create!(name: "Steph Curry", email: "user3@gmail.com")

party1 = ViewingParty.create!(duration: 90, date: "Mon, 29 Aug 2022 14:00:00 UTC +00:00", host_id: user2.id, movie_id: 244)
party2 = ViewingParty.create!(duration: 120, date: "Mon, 30 Aug 2022 17:00:00 UTC +00:00", host_id: user3.id, movie_id: 545)

user1party1= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
user1party2= UserViewingParty.create!(user_id: user1.id, viewing_party_id: party2.id)

user2party1= UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id)
user3party2= UserViewingParty.create!(user_id: user3.id, viewing_party_id: party2.id)