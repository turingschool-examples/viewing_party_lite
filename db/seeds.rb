  User.destroy_all

  user_1 = User.create(name: 'John Doe', email: 'JohnDoe@gmail.com')
  user_2 = User.create(name: 'Homer Simpson', email: 'HomerSimpson@gmail.com')

  party1 = Party.create!(date: Date.today, start_time: '20:00:00', movie_id: 278, title: 'Movie1', poster: '1.jpg')
  party2 = Party.create!(date: Date.today, start_time: '10:00:00', movie_id: 278, title: 'Movie2', poster: '2.jpg')

  up1 = UserParty.create!(user_id: user_1.id, party_id: party1.id, host: true)
  up2 = UserParty.create!(user_id: user_1.id, party_id: party2.id, host: false)
