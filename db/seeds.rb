# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PartyUser.destroy_all
ViewingParty.destroy_all
User.destroy_all


@user1 = User.create!(name: 'John', email: 'john.hennerich@gmail.com')
@user2 = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')

@vp1 = ViewingParty.create!(date: '2022/05/11', start_time: '12:00', duration: 120, movie_title: 'Star Wars')
@vp1a = ViewingParty.create!(date: '2022/05/11', start_time: '15:00', duration: 120, movie_title: 'Star Wars Empire Strikes Back')

@vp2 = ViewingParty.create!(date: '2022/05/11', start_time: '12:00', duration: 120, movie_title: 'The Godfather')

@user1.party_users.create!(viewing_party_id: @vp1.id, host: true )
@user1.party_users.create!(viewing_party_id: @vp1a.id, host: true )

@user2.party_users.create!(viewing_party_id: @vp2.id, host: true )
@user2.party_users.create!(viewing_party_id: @vp1.id, host: false )

