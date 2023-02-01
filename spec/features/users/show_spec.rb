require 'rails_helper'

RSpec.describe 'user dashboard' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
    @vp1 = ViewingParty.create!(movie_id: 1, date: 'Mon, 30 Jan 2023', party_duration: 118, start_time: Time.parse('19:00:00 UTC'))
    @vp2 = ViewingParty.create!(movie_id: 2, date: 'Tue, 31 Jan 2023', party_duration: 95, start_time: Time.parse('20:00:00 UTC'))
    @user1.viewing_party_users.create!(viewing_party_id: @vp1.id, hosting: true)
    @user1.viewing_party_users.create!(viewing_party_id: @vp2.id, hosting: false)
  end

  it "shows the <user's name>'s dashboard at the top of the page" do
    visit user_path(@user1)

    expect(page).to have_content("John Doe's Dashboard")
  end

  it 'has a button to discover movies and when I click that button I am redirected to user discover page' do
    visit user_path(@user1)

    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"
    save_and_open_page
    expect(current_path).to eq user_discover_index_path(@user1)

  end

  it 'has a section that lists viewing parties' do
    visit user_path(@user1)
   
    within "#viewing_party#{@vp1.id}" do
      expect(page).to have_content('January 30, 2023')
      expect(page).to have_content('7:00 pm')
      expect(page).to have_content('Hosting')
    end
    within "#viewing_party#{@vp2.id}" do
      expect(page).to have_content('January 31, 2023')
      expect(page).to have_content('8:00 pm')
      expect(page).to have_content('Invited')

    end
  end
end
