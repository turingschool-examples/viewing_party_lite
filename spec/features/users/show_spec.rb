require 'rails_helper'

RSpec.describe 'User Dashboard/Show Page', type: :feature do

  it "user dashboard displays name and a has button to discover movies" do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_path(user.id)
    expect(page).to have_content("Badger's Dashboard")
    click_button 'Discover Movies'
    expect(current_path).to eq(user_discover_index_path(user.id))
    expect(page).to have_content("Discover Movies")
  end

  it "has a section that listing viewing parties" do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_path(user.id)
    expect(page).to have_content("Viewing Parties")
  end

  it 'displays movie image, title, date and time, my name in bold, and all users for invited events' do
    user_1 = User.create!(name: 'Chealsea', email: 'chealsea@comcast.net')
    user_2 = User.create!(name: 'Leo', email: 'leo@comcast.net')
    user_3 = User.create!(name: 'Pedro', email: 'pedro@comcast.net')
    user_4 = User.create!(name: 'Noel', email: 'noel@comcast.net')

    party_1 = Party.create!(host: 'chealsea@comcast.net',
                            movie_name: 'The Shawshank Redemption',
                            movie_id: 278,
                            date: Date.new(2022, 10, 15),
                            duration: 205,
                            start_time: '12:00:00')

    party_2 = Party.create!(host: 'leo@comcast.net',
                            movie_name: 'The Godfather',
                            movie_id: 378,
                            date: Date.today,
                            duration: 185,
                            start_time: '12:00:00')

     PartyUser.create!(party_id: party_1.id, user_id: user_1.id)
     PartyUser.create!(party_id: party_1.id, user_id: user_2.id)
     PartyUser.create!(party_id: party_1.id, user_id: user_3.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_2.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_3.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_4.id)

     visit user_path(user_4.id)

     #within "#invitees" do
       expect(page).to have_content("Title: The Godfather")
       expect(page).to have_content("Host Email: leo@comcast.net")
       expect(page).to have_content("Date: #{Date.today.strftime("%T")}")
       expect(page).to have_content("Start Time: 12:00:00")
       expect(page).to have_content("Duration: 3 h 5 min")
       expect(page).to have_content("Noel")
       expect(page).to have_content("Pedro")
       expect(page).to_not have_content("Chelsea")
     #end
  end

  it 'displays movie image, title, date and time, i am host, and all users' do
    user_1 = User.create!(name: 'Chealsea', email: 'chealsea@comcast.net')
    user_2 = User.create!(name: 'Leo', email: 'leo@comcast.net')
    user_3 = User.create!(name: 'Pedro', email: 'pedro@comcast.net')
    user_4 = User.create!(name: 'Noel', email: 'noel@comcast.net')

    party_1 = Party.create!(host: 'chealsea@comcast.net',
                            movie_name: 'The Shawshank Redemption',
                            movie_id: 278,
                            date: Date.new(2022, 10, 15),
                            duration: 205,
                            start_time: '12:00:00')

    party_2 = Party.create!(host: 'leo@comcast.net',
                            movie_name: 'The Godfather',
                            movie_id: 378,
                            date: Date.today,
                            duration: 185,
                            start_time: '12:00:00')

     PartyUser.create!(party_id: party_1.id, user_id: user_1.id)
     PartyUser.create!(party_id: party_1.id, user_id: user_2.id)
     PartyUser.create!(party_id: party_1.id, user_id: user_3.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_2.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_3.id)
     PartyUser.create!(party_id: party_2.id, user_id: user_4.id)
  end
end
