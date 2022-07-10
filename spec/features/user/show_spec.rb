require 'rails_helper'
#save_and_open_page

RSpec.describe "User Dash/Show page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
    @user3 = User.create!(name: 'Deannah', email: 'FrogStomper9000@Muahaha.com')
    @user4 = User.create!(name: 'Casey', email: 'EternalPancakes@Geemail.com')
  end

  it 'displays the users name at the top of the page' do
    visit "/users/#{@user2.id}"

    expect(page).to have_content(@user2.name)
    expect(page).to have_content("Parker's Dashboard")
    expect(page).to_not have_content("Sai's Dashboard")
  end

  it 'has a button to discover movies' do
    visit "/users/#{@user1.id}"

    expect(page).to have_button("Discover Movies")
  end

  it 'button to discover movies redirects to discover page' do
    visit "/users/#{@user1.id}"

    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(current_path).to_not eq("/users/#{@user2.id}/discover")
  end

  describe 'viewing party section' do
    before(:each) do
      @spirit = @user1.viewing_parties.create!(duration: 180, date: Date.today, time: Time.now, movie_id: 129)
      PartyUser.create!(user_id: @user2.id, viewing_party_id: @spirit.id)
      PartyUser.create!(user_id: @user3.id, viewing_party_id: @spirit.id)
      PartyUser.create!(user_id: @user4.id, viewing_party_id: @spirit.id)

      @rocky = @user3.viewing_parties.create!(duration: 180, date: Date.tomorrow, time: Time.now, movie_id: 36685)
      PartyUser.create!(user_id: @user2.id, viewing_party_id: @rocky.id)
      PartyUser.create!(user_id: @user1.id, viewing_party_id: @rocky.id)
      PartyUser.create!(user_id: @user4.id, viewing_party_id: @rocky.id)
    end
    it 'has a section that lists viewing parties', :vcr do
      visit "/users/#{@user1.id}"

      within '#viewingparties' do
        expect(page).to have_content("Viewing Parties")
        expect(page).to have_content("My Viewing Parties")
        within "#party#{@spirit.movie_id}" do
          expect(page).to have_content("Hosting")
        end
      end
    end

    it 'displays information about the hosted viewing parties', :vcr do
      visit "/users/#{@user3.id}"
      formatted_time = @rocky.time.strftime("%l:%M %p")
      formatted_date = @rocky.date.strftime("%b %d, %Y")

      within "#party#{@rocky.movie_id}" do
        expect(page).to have_content("The Rocky Horror Picture Show")
        expect(page).to_not have_content("Spirited Away")
        expect(page).to have_content(formatted_date)
        expect(page).to have_content(formatted_time)
        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user4.name)
        expect(page).to have_content("Hosting")
      end
    end

    it 'displays information about the invited party correctly', :vcr do
      visit "/users/#{@user3.id}"
      formatted_time = @spirit.time.strftime("%l:%M %p")
      formatted_date = @spirit.date.strftime("%b %d, %Y")

      within "#party#{@spirit.movie_id}" do
        expect(page).to_not have_content("The Rocky Horror Picture Show")
        expect(page).to have_content("Spirited Away")
        expect(page).to have_content(formatted_date)
        expect(page).to have_content(formatted_time)
        expect(page).to have_content(@user3.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user4.name)
        expect(page).to_not have_content(@user1.name)
        expect(page).to have_content("Invited")
      end
    end

    it 'displays each title as a link to the movie details page', :vcr do
      visit "/users/#{@user3.id}"

      expect(page).to have_link("Spirited Away")
      expect(page).to have_link("The Rocky Horror Picture Show")

      click_link("Spirited Away")

      expect(page).to have_current_path("/users/#{@user3.id}/movies/#{@spirit.movie_id}")
    end
  end
end
