# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(name: "Eli Fuchsman", email: "eli@gmail.com")
viewing_party1 = ViewingParty.create!(movie_id: 11, duration: 200, date: 'November 30, 2022',
                                       start_time: '7 PM')
viewing_party2 = ViewingParty.create!(movie_id: 550, duration: 150, date: 'December 14, 2022',
                                       start_time: '6:30 PM')
vpu1 = ViewingPartyUser.create!(user: user1, viewing_party: viewing_party1)
vpu2 = ViewingPartyUser.create!(user: user1, viewing_party: viewing_party2, host: 1)
