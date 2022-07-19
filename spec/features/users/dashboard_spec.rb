require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}
  let!(:attendee_table_1) { Attendee.create(user_id: users[0].id, viewing_party_id: viewing_party.id)}
  let!(:attendee_table_2) { Attendee.create(user_id: users[1].id, viewing_party_id: viewing_party.id)}
  let!(:host_party) { ViewingParty.create(movie: 'Shazam', movie_id: 42, duration: 666, host_id: users[0].id, date: "Mon, 11 Jul 2022", start_time: "Sun, 02 Jan 2000 01:14:20 UTC +00:00") }
  # before :each do 
  #   visit user_path(users[0])

  let!(:bob) { User.create(user_name: 'Bob', email: 'Bob@gmail.com', password: 'blob', password_confirmation: 'blob') }

  before :each do
    visit login_path
    fill_in :email, with: 'Bob@gmail.com'
    fill_in :password, with: 'blob'
    click_on 'Log In'
  end

  it "can display the users name at the top of the page", :vcr do
    expect(page).to have_content("#{bob.user_name} Dashboard")
  end

  it "has a button to take you to the movies page", :vcr do
    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"

    expect(current_path).to eq(discover_path)

  end

  describe 'it shows all the viewing parties that the user has been invited to' do
    
    xit 'displays the movie image', :vcr do
      within "#invited" do
        within "#party-#{viewing_party.id}" do
          expect(page).to have_image()
        end
      end
    end

    xit 'displays the movies title as a link which leads to the movie show page', :vcr do
      within "#invited" do
        within "#party-#{viewing_party.id}" do
          click_link("#{viewing_party.movie}")
          expect(current_path).to eq(user_movie_path(users[0].id, "#{viewing_party.movie_id}"))
        end
      end
    end

    xit 'displays the date and time of the event', :vcr do
      within "#invited" do
        within "#party-#{viewing_party.id}" do
          expect(page).to have_content("#{viewing_party.date.strftime('%a, %B %d, %Y')}")
          expect(page).to have_content("#{viewing_party.start_time.strftime("%I:%M%p")}")
        end
      end
    end

    xit 'displays the host of the event', :vcr do
      within "#invited" do
        within "#party-#{viewing_party.id}" do
          expect(page).to have_content("Host: #{viewing_party.user.user_name}")
        end
      end
    end

    xit 'displays a list of users invited to the party, with my name in bold', :vcr do
      within "#invited" do
        within "#party-#{viewing_party.id}" do
          expect(page).to have_content(viewing_party.users[0].user_name)
          expect(page).to have_content(viewing_party.users[1].user_name)
          expect(page).to_not have_content(users[2].user_name)
        end
      end
    end
  end

  describe 'it shows the viewing parties that the user has created', :vcr do

     xit 'displays the movie image' do
      withing "#created" do
        within "#party-#{host_party.id}" do
          expect(page).to have_image()
        end
      end
    end

    xit 'displays the movies title as a link which leads to the movie show page', :vcr do
      within "#created" do
        within "#party-#{host_party.id}" do
          click_link("#{viewing_party.movie}")
          expect(current_path).to eq(user_movie_path(users[0].id, "#{viewing_party.movie_id}"))
        end
      end
    end

    xit 'displays the date and time of the event', :vcr do
      within "#created" do
        within "#party-#{host_party.id}" do
          expect(page).to have_content("#{viewing_party.date}")
          expect(page).to have_content("#{viewing_party.start_time}")
        end
      end
    end

    xit 'displays that I am the host of the event', :vcr do
      within "#created" do
        within "#party-#{host_party.id}" do
          expect(page).to have_content("Host: #{viewing_party.user}")
        end
      end
    end

    xit 'displays a list of users invited to the party', :vcr do
      within "#created" do
          expect(page).to have_content(viewing_party.users[0].user_name)
          expect(page).to have_content(viewing_party.users[1].user_name)
          expect(page).to_not have_content(viewing_party.users[2].user_name)
      end
    end
  end
end
