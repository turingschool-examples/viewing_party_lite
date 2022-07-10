# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Party Dashboard Page', :vcr do
  it 'creates a new party' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')
    @user3 = User.create!(name: 'Frank', email: 'Franks@jimar.com')
    @user4 = User.create!(name: 'Timmay', email: 'Tim@jimar.com')

    visit "/users/#{@user1.id}/movies/550/viewing-party/new"

    fill_in 'Duration', with: '150'
    fill_in 'Date', with: '12/1/2022'
    fill_in 'Start', with: '18:00'
    check @user2.name.to_s
    check @user3.name.to_s

    click_on 'Create Party'
    expect(current_path).to eq("/users/#{@user1.id}/viewing-party/dashboard")

    expect(page).to have_content('Title: Fight Club')
    expect(page).to have_content('Date: 12/01/2022')
    expect(page).to have_content('Start Time: 18:00')
    expect(page).to have_content('Duration: 150 minutes')
    expect(page).to have_content('You are the host of this party!')
    expect(page).to have_content(@user2.name.to_s)
    expect(page).to have_content(@user3.name.to_s)

    expect(page).to_not have_content(@user4.name.to_s)

    visit "/users/#{@user2.id}/viewing-party/dashboard"
    expect(page).to have_content('You are not the host of this party!')
    expect(page).to have_content(@user1.name.to_s)
    expect(page).to have_content(@user2.name.to_s)
    expect(page).to have_content(@user3.name.to_s)

    expect(page).to_not have_content(@user4.name.to_s)
  end
end
