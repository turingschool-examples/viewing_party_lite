# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

@users_hosts = []
@users_invitees = []
@viewing_parties = []
@viewing_party_users = []

5.times do
  @users_hosts << FactoryBot.create(:user)
end

10.times do
  @users_invitees << FactoryBot.create(:user)
end

@viewing_parties << ViewingParty.create(
  start_time: Faker::Time.backward(days:365),
  party_duration_minutes: 160,
  movie_title: "The Shawshank Redemption",
  movie_duration_minutes: 142
)

  @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: @users_hosts.sample.id, viewing_party_id: @viewing_parties[0].id, status: 1)

  first_party_invitees = @users_invitees.sample(5)

  first_party_invitees.each do |invitee|
    @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: invitee.id, viewing_party_id: @viewing_parties[0].id, status: 0)
  end

@viewing_parties << ViewingParty.create(
  start_time: Faker::Time.backward(days:365),
  party_duration_minutes: 200,
  movie_title: "Dilwale Dulhania Le Jayenge",
  movie_duration_minutes: 190
)
  @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: @users_hosts.sample.id, viewing_party_id: @viewing_parties[1].id, status: 1)

  second_party_invitees = @users_invitees.sample(5)

  second_party_invitees.each do |invitee|
    @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: invitee.id, viewing_party_id: @viewing_parties[1].id, status: 0)
  end

@viewing_parties << ViewingParty.create(
  start_time: Faker::Time.backward(days:365),
  party_duration_minutes: 100,
  movie_title: "12 Angry Men",
  movie_duration_minutes: 97
)

  @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: @users_hosts.sample.id, viewing_party_id: @viewing_parties[2].id, status: 1)

  third_party_invitees = @users_invitees.sample(5)

  third_party_invitees.each do |invitee|
    @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: invitee.id, viewing_party_id: @viewing_parties[2].id, status: 0)
  end

@viewing_parties << ViewingParty.create(
  start_time: Faker::Time.backward(days:365),
  party_duration_minutes: 110,
  movie_title: "Grave of the Fireflies",
  movie_duration_minutes: 89
)

  @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: @users_hosts.sample.id, viewing_party_id: @viewing_parties[3].id, status: 1)

  fourth_party_invitees = @users_invitees.sample(5)

  fourth_party_invitees.each do |invitee|
    @viewing_party_users << FactoryBot.create(:viewing_party_user, user_id: invitee.id, viewing_party_id: @viewing_parties[3].id, status: 0)
  end