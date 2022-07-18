require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'has discover movies button' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir", password: 'test123', password_confirmation: 'test123')

    visit user_path(user1.id)
    click_button 'Discover Movies'

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

  it ' has a title at the top of the page that includes the users name' do
    user1 = User.create!(email: 'user1@example.com', name: 'Jeff Casimir')

    visit user_path(user1.id)

    within('#header') do
      expect(page).to have_content("Jeff Casimir's Dashboard")
    end
  end

  it 'shows a list of viewing parties the user is invited to' do
    user1 = User.create!(name: 'Jeff', email: 'dajeffe@gmail.com')
    user2 = User.create!(name: 'Mark', email: 'markymark@gmail.com')
    user3 = User.create!(name: 'Julie', email: 'rtj@gmail.com')
    user4 = User.create!(name: 'Steve', email: 'thebeeve@gmail.com')
    user5 = User.create!(name: 'Dave', email: 'daveyjones@gmail.com')
    user6 = User.create!(name: 'Kim', email: 'kimbo@gmail.com')
    user7 = User.create!(name: 'James', email: 'jimmy@gmail.com')
    user8 = User.create!(name: 'Ryan', email: 'rainman@gmail.com')
    user9 = User.create!(name: 'Stirling', email: 'stirbydirbydoo@gmail.com')
    party1 = ViewingParty.create!(movie_title: 'Hot Rod',
                                  duration: 90,
                                  # attendees: [user2, user3, user4, user1],
                                  start_date: '2022-08-19',
                                  start_time: '18:00',
                                  image: 'hot_rod_image',
                                  host_id: user2.id)
    party2 = ViewingParty.create!(movie_title: 'Semipro',
                                  duration: 90,
                                  # attendees: [user5, user6, user7],
                                  start_date: '2022-08-19',
                                  start_time: '17:00',
                                  image: 'semipro_image',
                                  host_id: user2.id)
    party3 = ViewingParty.create!(movie_title: 'Barry Lyndon',
                                  duration: 180,
                                  # attendees: [user8, user9, user1],
                                  start_date: '2022-08-19',
                                  start_time: '12:00',
                                  image: 'semipro_image',
                                  host_id: user1.id)
    uservp1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
    uservp2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id)
    uservp3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id)
    uservp4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id)

    uservp5 = UserViewingParty.create!(user_id: user5.id, viewing_party_id: party2.id)
    uservp6 = UserViewingParty.create!(user_id: user6.id, viewing_party_id: party2.id)
    uservp7 = UserViewingParty.create!(user_id: user7.id, viewing_party_id: party2.id)

    uservp8 = UserViewingParty.create!(user_id: user8.id, viewing_party_id: party3.id)
    uservp9 = UserViewingParty.create!(user_id: user9.id, viewing_party_id: party3.id)
    uservp10 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party3.id)

    visit user_path(user1.id)

    within '#invited_to' do
      expect(page).to have_content('Hot Rod')
      expect(page).to have_content('Barry Lyndon')
      expect(page).to_not have_content('Semipro')
    end
    # must include: movie image,
    #               movie title(as link to movie show page),
    #               date and time of event,
    #               who is hosting the event,
    #               list of users invited
  end

  it 'show a list of viewing parties the user has created' do
    user1 = User.create!(name: 'Jeff', email: 'dajeffe@gmail.com')
    user2 = User.create!(name: 'Mark', email: 'markymark@gmail.com')
    user3 = User.create!(name: 'Julie', email: 'rtj@gmail.com')
    user4 = User.create!(name: 'Steve', email: 'thebeeve@gmail.com')
    user5 = User.create!(name: 'Dave', email: 'daveyjones@gmail.com')
    user6 = User.create!(name: 'Kim', email: 'kimbo@gmail.com')
    user7 = User.create!(name: 'James', email: 'jimmy@gmail.com')
    user8 = User.create!(name: 'Ryan', email: 'rainman@gmail.com')
    user9 = User.create!(name: 'Stirling', email: 'stirbydirbydoo@gmail.com')
    party1 = ViewingParty.create!(movie_title: 'Hot Rod',
                                  duration: 90,
                                  # attendees: [user2, user3, user4, user1],
                                  start_date: '2022-08-19',
                                  start_time: '18:00',
                                  image: 'hot_rod_image',
                                  host_id: user2.id)
    party2 = ViewingParty.create!(movie_title: 'Semipro',
                                  duration: 90,
                                  # attendees: [user5, user6, user7],
                                  start_date: '2022-08-19',
                                  start_time: '17:00',
                                  image: 'semipro_image',
                                  host_id: user2.id)
    party3 = ViewingParty.create!(movie_title: 'Barry Lyndon',
                                  duration: 180,
                                  # attendees: [user8, user9, user1],
                                  start_date: '2022-08-19',
                                  start_time: '12:00',
                                  image: 'semipro_image',
                                  host_id: user1.id)
    uservp1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id)
    uservp2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id)
    uservp3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id)
    uservp4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id)

    uservp5 = UserViewingParty.create!(user_id: user5.id, viewing_party_id: party2.id)
    uservp6 = UserViewingParty.create!(user_id: user6.id, viewing_party_id: party2.id)
    uservp7 = UserViewingParty.create!(user_id: user7.id, viewing_party_id: party2.id)

    uservp8 = UserViewingParty.create!(user_id: user8.id, viewing_party_id: party3.id)
    uservp9 = UserViewingParty.create!(user_id: user9.id, viewing_party_id: party3.id)
    uservp10 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party3.id)

    visit user_path(user1.id)

    within '#hosting' do
      expect(page).to have_content('Barry Lyndon')
      expect(page).to_not have_content('Semipro')
      expect(page).to_not have_content('Hot Rod')
    end
    # must include: movie image,
    #               movie title(as link to movie show page),
    #               Date and time of event,
    #               That I am the host of the party,
    #               List of friends invited to the viewing party
  end
end
