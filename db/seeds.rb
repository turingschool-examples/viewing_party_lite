require 'factory_bot_rails'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = FactoryBot.create(:user)
@party1 = FactoryBot.create(:party)
@party2 = FactoryBot.create(:party)


@user2 = FactoryBot.create(:user)
@party3 = FactoryBot.create(:party)

@user3 = FactoryBot.create(:user)

@user_party1 = FactoryBot.create(:user_party, user: @user1, party: @party1)
@user_party2 = FactoryBot.create(:user_party, user: @user1, party: @party2)
@user_party3 = FactoryBot.create(:user_party, user: @user2, party: @party3)

