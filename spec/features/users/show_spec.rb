require 'rails_helper'

describe 'User dashboard page' do
  describe 'display' do
    it 'has the name of the user as the header' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit("/users/#{user.id}")
      expect(page).to have_content("#{user.name}'s Dashboard")
    end

    it 'has a button to discover movies' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu')
      visit("/users/#{user.id}")
      within '.discover' do
        expect(page).to have_button('Discover Movies')
      end
    end

    it 'has a section that lists viewing parties' do
      user = User.create(name: 'Sam', email: 'sam@supercool.edu')
      visit("/users/#{user.id}")
      within '.discover' do
        expect(page).to have_content('Viewing Parties:')
      end
    end
  end
end
