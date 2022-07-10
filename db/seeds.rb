# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
@user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
@user3 = User.create!(name: 'Deannah', email: 'FrogStomper9000@Muahaha.com')
@user4 = User.create!(name: 'Casey', email: 'EternalPancakes@Geemail.com')

@spirit = @user1.viewing_parties.create!(duration: 180, date: Date.today, time: Time.now, movie_id: 129)
PartyUser.create!(user_id: @user2.id, viewing_party_id: @spirit.id)
PartyUser.create!(user_id: @user3.id, viewing_party_id: @spirit.id)
PartyUser.create!(user_id: @user4.id, viewing_party_id: @spirit.id)

@rocky = @user3.viewing_parties.create!(duration: 180, date: Date.tomorrow, time: Time.now, movie_id: 36685)
PartyUser.create!(user_id: @user2.id, viewing_party_id: @rocky.id)
PartyUser.create!(user_id: @user1.id, viewing_party_id: @rocky.id)
PartyUser.create!(user_id: @user4.id, viewing_party_id: @rocky.id)

@godfather = @user1.viewing_parties.create!(duration: 175, date: Date.today, time: Time.now, movie_id: 238)
PartyUser.create!(user_id: @user2.id, viewing_party_id: @godfather.id)
