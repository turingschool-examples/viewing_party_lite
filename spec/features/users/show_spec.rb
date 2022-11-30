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
      expect(page).to have_content("Chad's Dashboard")
      expect(page).to_not have_content("Jessica's Dashboard")
    end
  end

  it 'should have a button to discover movies' do
    visit user_path(@user1.id)

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
    end
  end

  it 'should have a section that lists viewing parties' do
    visit user_path(@user1.id)

    within '#viewing-parties' do
      expect(page).to have_content('Viewing Parties')
    end
  end
end
