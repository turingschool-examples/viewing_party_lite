# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user_1 = User.create!(name: 'William', email: 'william@gmail.com')
@user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
@user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

@viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22', host: @user_2.id)
@viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46', host: @user_1.id)

@viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
@viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)

@viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)
@viewing_party_user_4 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_2.id)
