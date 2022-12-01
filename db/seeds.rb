# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_1 = User.create(name: "John Doe", email: "JohnDoe@email.net")
user_2 = User.create(name: "Jill Doe", email: "Jill@email.net")
user_3 = User.create(name: "Jake Doe", email: "Jake@email.net")
party_1 = ViewParty.create(movie_id: 550, movie_name: "Fight Club", duration: 139, datetime: DateTime.now + 1)
party_2 = ViewParty.create(movie_id: 390, movie_name: "Lisbon Story", duration: 139, datetime: DateTime.now + 9)
UserViewParty.create(user_id: user.id, view_party_id: party_1.id, host: true)
UserViewParty.create(user_id: user.id, view_party_id: party_2.id, host: false)