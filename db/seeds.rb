# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserParty.destroy_all
User.destroy_all
ViewingParty.destroy_all

@vp1 = ViewingParty.create!(movie_id: 111, duration: 151, date: Time.new(2022, 0o4, 12, 21, 0o0),
                            start_time: Time.new(2022, 0o4, 12, 21, 0o0, 0o0, '-06:00'))
@vp2 = ViewingParty.create!(movie_id: 112, duration: 152, date: Time.new(2022, 0o4, 11, 20, 30),
                            start_time: Time.new(2022, 0o4, 11, 20, 30, 0o0, '-06:00'))
@vp3 = ViewingParty.create!(movie_id: 113, duration: 153, date: Time.new(2022, 0o4, 14, 20, 0o0),
                            start_time: Time.new(2022, 0o4, 14, 20, 0o0, 0o0, '-06:00'))
@vp4 = ViewingParty.create!(movie_id: 114, duration: 154, date: Time.new(2022, 0o4, 13, 19, 30),
                            start_time: Time.new(2022, 0o4, 13, 19, 30, 0o0, '-06:00'))
@vp5 = ViewingParty.create!(movie_id: 115, duration: 155, date: Time.new(2022, 0o4, 15, 19, 0o0),
                            start_time: Time.new(2022, 0o4, 15, 19, 0o0, 0o0, '-06:00'))
@vp6 = ViewingParty.create!(movie_id: 116, duration: 156, date: Time.new(2022, 0o4, 16, 19, 0o0),
                            start_time: Time.new(2022, 0o4, 15, 19, 0o0, 0o0, '-06:00'))
@vp7 = ViewingParty.create!(movie_id: 117, duration: 157, date: Time.new(2022, 0o4, 10, 18, 30),
                            start_time: Time.new(2022, 0o4, 10, 18, 30, 0o0, '-06:00'))
@vp8 = ViewingParty.create!(movie_id: 118, duration: 158, date: Time.new(2022, 0o4, 9, 18, 0o0),
                            start_time: Time.new(2022, 0o4, 9, 18, 0o0, 0o0, '-06:00'))
@vp9 = ViewingParty.create!(movie_id: 550, duration: 159, date: Time.new(2022, 0o4, 18, 17, 30),
                            start_time: Time.new(2022, 0o4, 18, 17, 30, 0o0, '-06:00'))
@vp10 = ViewingParty.create!(movie_id: 120, duration: 161, date: Time.new(2022, 0o4, 21, 17, 0o0),
                             start_time: Time.new(2022, 0o4, 21, 17, 0o0, 0o0, '-06:00'))

@user1 = User.create!(name: 'Becky', email: 'becky@example.com')
@user2 = User.create!(name: 'Steven', email: 'steven@example.com')
@user3 = User.create!(name: 'Ashley', email: 'Ashley@example.com')
@user4 = User.create!(name: 'Colton', email: 'Colton@example.com')
@user5 = User.create!(name: 'Bruce', email: 'Bruce@example.com')
@user6 = User.create!(name: 'Tony', email: 'Tony@example.com')
@user7 = User.create!(name: 'Peter', email: 'Peter@example.com')
@user8 = User.create!(name: 'Natasha', email: 'Natasha@example.com')
@user9 = User.create!(name: 'Diana', email: 'Diana@example.com')
@user10 = User.create!(name: 'Clint', email: 'Clint@example.com')

@up1 = UserParty.create!(viewing_party: @vp1, user: @user1, host: true)
@up2 = UserParty.create!(viewing_party: @vp1, user: @user2, host: false)
@up3 = UserParty.create!(viewing_party: @vp1, user: @user3, host: false)
@up4 = UserParty.create!(viewing_party: @vp1, user: @user4, host: false)
@up5 = UserParty.create!(viewing_party: @vp2, user: @user5, host: true)
@up6 = UserParty.create!(viewing_party: @vp2, user: @user6, host: false)
@up7 = UserParty.create!(viewing_party: @vp2, user: @user7, host: false)
@up8 = UserParty.create!(viewing_party: @vp2, user: @user8, host: false)
@up9 = UserParty.create!(viewing_party: @vp3, user: @user9, host: true)
@up10 = UserParty.create!(viewing_party: @vp3, user: @user10, host: false)
@up11 = UserParty.create!(viewing_party: @vp3, user: @user1, host: false)
@up12 = UserParty.create!(viewing_party: @vp4, user: @user2, host: true)
@up13 = UserParty.create!(viewing_party: @vp4, user: @user3, host: false)
@up14 = UserParty.create!(viewing_party: @vp5, user: @user4, host: true)
@up15 = UserParty.create!(viewing_party: @vp5, user: @user5, host: false)
@up16 = UserParty.create!(viewing_party: @vp6, user: @user6, host: true)
@up17 = UserParty.create!(viewing_party: @vp6, user: @user10, host: false)
@up18 = UserParty.create!(viewing_party: @vp7, user: @user7, host: true)
@up19 = UserParty.create!(viewing_party: @vp7, user: @user9, host: false)
@up20 = UserParty.create!(viewing_party: @vp8, user: @user8, host: true)
@up21 = UserParty.create!(viewing_party: @vp8, user: @user1, host: false)
@up22 = UserParty.create!(viewing_party: @vp9, user: @user3, host: true)
@up23 = UserParty.create!(viewing_party: @vp9, user: @user6, host: false)
@up24 = UserParty.create!(viewing_party: @vp10, user: @user2, host: true)
@up25 = UserParty.create!(viewing_party: @vp10, user: @user7, host: false)
