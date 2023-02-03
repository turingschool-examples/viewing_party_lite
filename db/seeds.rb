# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user_1 = User.create!(name: "John", email: "john@example.com")
@user_2 = User.create!(name: "Bill", email: "nom@example.com")
@user_3 = User.create!(name: "Bob", email: "nin@example.com")
@user_4 = User.create!(name: "Mat", email: "mat@example.com")