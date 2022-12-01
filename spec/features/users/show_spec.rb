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

  it 'should have a section that lists viewing parties' do
    visit user_path(@user1.id)

    within '#viewing-parties' do
      expect(page).to have_content('Viewing Parties')
    end
  end

  it 'should contain title of Viewing Party and a Home link that will redirect the user landing page' do
    visit user_path(@user1.id)

    within('#dashboard') do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq(root_path)
    end
  end
end
