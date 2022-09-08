# frozen_string_literal: true

eli = User.create!(name: 'Eli', email: 'es@g')
sunny = User.create!(name: 'Sunny', email: 'sm@g')

frozen = Party.create!(movie_id: 1, start_time: '2022-12-25 06:30:00 UTC', duration: 90, movie_title: 'Frozen')
moana = Party.create!(movie_id: 2, start_time: '2022-12-31 12:00:00 UTC', duration: 120, movie_title: 'Moana')

PartyUser.create!(party: frozen, user: eli, host: true)
PartyUser.create!(party: frozen, user: sunny, host: false)
PartyUser.create!(party: moana, user: sunny, host: true)
PartyUser.create!(party: moana, user: eli, host: false)
