require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  it 'should display users name at the top of the page' do
    visit user_path(@user1.id)

    within '#header' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end
  end

  it 'should have a button to discover movies that redirects to the user discover page' do
    visit user_path(@user1.id)

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
      click_on 'Discover Movies'

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end

  it 'should contain title of Viewing Party and a Home link that will redirect to the user landing page' do
    visit user_path(@user1.id)

    within('#dashboard') do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq(root_path)
    end
  end

  describe 'Viewing Parties' do
    before(:each) do
    end
    # As a user,
    # When I visit a user dashboard,
    it 'should have a section that lists viewing parties' do
      visit user_path(@user1.id)

      within '#viewing-parties' do
        expect(page).to have_content('Viewing Parties')
      end
    end
    # I should see the viewing parties that the user has been invited to with the following details:

    it 'should show viewing parties that the user has been invited to' do
      visit user_path(@user1.id)

      within '#viewing-parties' do
        expect(page).to have_content('Viewing Parties')
      end
    end
    # [ ] Movie Image
    # [ ] Movie Title, which links to the movie show page
    # [ ] Date and Time of Event
    # [ ] Who is hosting the event
    # [ ] List of users invited, with my name in bold

    # I should also see the viewing parties that the user has created with the following details:

    # [ ] Movie Image
    # [ ] Movie Title, which links to the movie show page
    # [ ] Date and Time of Event
    # [ ] That I am the host of the party
    # [ ] List of friends invited to the viewing party
  end
end
