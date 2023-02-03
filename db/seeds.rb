# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!({ name: 'Samuel Cox', email: 'samuel@example.com' })

10.times {
  name = Faker::FunnyName.name
  User.create!({ name: name, email: Faker::Internet.email(name: name) })
}

3.times {
  ViewingParty.create!({start_time: Faker::Time.between(from: Time.now - 30, to: Time.now + 30), date: Faker::Date.between(from: Date.today, to: 30.days.from_now), duration: Faker::Number.within(range: 175..240), movie_id: [238, 278, 315162].shuffle.shuffle.first })
}

5.times {
  viewing_party_id = ViewingParty.all.shuffle.shuffle.first.id
  user = User.all.shuffle.shuffle.first
  UserViewingParty.create!({ viewing_party_id: viewing_party_id, user_id: (
      unless UserViewingParty.exists?(user_id: user.id, viewing_party_id: viewing_party_id)
        user.id
      else
        (User.all - [user]).shuffle.shuffle.first.id
      end
  ),
    hosting: !UserViewingParty.exists?(viewing_party_id: viewing_party_id) })
}
