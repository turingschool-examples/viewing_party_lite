# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
mj = User.create!(name: 'Micheal Jordan', email: 'user1@gmail.com')
kobe = User.create!(name: 'Kobe Bryant', email: 'user2@gmail.com')
steph = User.create!(name: 'Steph Curry', email: 'user3@gmail.com')
