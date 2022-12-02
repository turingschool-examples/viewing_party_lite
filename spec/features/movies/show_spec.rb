require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  it 'lists the first 10 cast members and the names of their characters' do
    visit user_discover_path(@user1.id)
    fill_in :keyword, with: 'Godfather'
    click_button('Search by Movie Title')

    within('#movie_238') do
      click_link('The Godfather')
    end

    within('#cast-members') do
      expect(page).to have_content('Marlon Brando as Don Vito Corleone')
      expect(page).to have_content('Al Pacino as Don Michael Corleone')
      expect(page).to_not have_content('Chris Pratt as Mario')
    end
  end
end
