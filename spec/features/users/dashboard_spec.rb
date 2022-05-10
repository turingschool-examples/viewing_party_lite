# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Zel', email: 'lorem@ipsum.com')
    @user2 = User.create!(name: 'Alex', email: 'ipsum@lorem.com')
  end

  it 'contains all expected attributes of the selected user' do
    visit "/users/#{@user1.id}"

    within '#title' do
      expect(page).to have_content(@user1.name)
      expect(page).to_not have_content(@user1.email)
      expect(page).to_not have_content(@user2.name)
      expect(page).to_not have_content(@user2.email)
    end

    within '#discover-movies' do
      expect(page).to have_button('Discover Movies')
    end

    within '#watch-parties' do
      expect(page).to have_content('Current Scheduled Parties!')
    end
  end
end
