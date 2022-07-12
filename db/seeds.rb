# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@lama = User.create!(name: 'Happy Lama', email: 'Happy_Lama@example.com', password: 'password1',
                     password_confirmation: 'password1')
@duck = User.create!(name: 'Sad Duck', email: 'Sad_Duck@example.com', password: 'password12',
                     password_confirmation: 'password12')
@horse = User.create!(name: 'Confused Horse', email: 'Confused_Horse@example.com', password: 'password123',
                      password_confirmation: 'password123')

@lama_movie = Party.create!(movie_id: 1, duration_time: 127, start_date: Date.today, start_time: Time.now,
                            user_id: @lama.id, movie_name: 'Jump for Joy')
@lama_movie2 = Party.create!(movie_id: 3, duration_time: 127, start_date: Date.today, start_time: Time.now,
                             user_id: @lama.id, movie_name: 'Jump for Joy 2')
@inv_1 = UserParty.create!(user_id: @duck.id, party_id: @lama_movie.id)
@inv_2 = UserParty.create!(user_id: @horse.id, party_id: @lama_movie.id)

@duck_movie = Party.create!(movie_id: 2, duration_time: 90, start_date: Date.today, start_time: Time.now,
                            user_id: @duck.id, movie_name: 'Deadpool')
@inv_1 = UserParty.create!(user_id: @lama.id, party_id: @duck_movie.id)
@inv_2 = UserParty.create!(user_id: @horse.id, party_id: @duck_movie.id)
