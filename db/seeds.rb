# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ronda = User.create(name: "Ronda Reynolds", email: "rr@gmail.com")
bob = User.create(name: "Bob Boylan", email: "bb@gmail.com")
terry = User.create(name: "Terry Tinkerson", email: "tt@gmail.com")

vp_1 = ViewingParty.create(
  movie_id: 17473,
  duration: 110,
  date: "2022-10-31",
  start_time: "16:00:00",
  host: ronda
)

vp_2 = ViewingParty.create(
  movie_id: 36685,
  duration: 180,
  date: "2022-11-18",
  start_time: "18:30:00",
  host: bob
)

vp_1.users << [bob, terry]
vp_2.users << [ronda, terry]

