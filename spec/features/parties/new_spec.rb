# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Party New Page', :vcr do
  it 'creates a new party' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')
    @user3 = User.create!(name: 'Frank', email: 'Franks@jimar.com')
    @user4 = User.create!(name: 'Timmay', email: 'Tim@jimar.com')

    visit "/users/#{@user1.id}/movies/550/viewing-party/new"

    # save_and_open_page

    expect(page).to have_content('Fight Club')
    # expect(page).to have_content(139)

    fill_in 'Duration', with: '150'
    fill_in 'Date', with: '12/1/2022'
    fill_in 'Start', with: '18:00'
    check @user2.name.to_s
    check @user3.name.to_s
    # check "#{@user4.name}"
    click_on 'Create Party'

    expect(current_path).to eq("/users/#{@user1.id}/viewing-party/dashboard")
  end

  it 'creates a new party with no attendees' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')
    @user3 = User.create!(name: 'Frank', email: 'Franks@jimar.com')
    @user4 = User.create!(name: 'Timmay', email: 'Tim@jimar.com')

    visit "/users/#{@user1.id}/movies/550/viewing-party/new"

    expect(page).to have_content('Fight Club')

    fill_in 'Duration', with: '150'
    fill_in 'Date', with: '12/1/2022'
    fill_in 'Start', with: '18:00'
    click_on 'Create Party'

    expect(current_path).to eq("/users/#{@user1.id}/viewing-party/dashboard")
  end

  it 'tries to make a new party with a duration less than runtime', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')
    @user3 = User.create!(name: 'Frank', email: 'Franks@jimar.com')
    @user4 = User.create!(name: 'Timmay', email: 'Tim@jimar.com')

    visit "/users/#{@user1.id}/movies/550/viewing-party/new"

    # save_and_open_page

    expect(page).to have_content('Fight Club')
    # expect(page).to have_content(139)

    fill_in 'Duration', with: '120'
    fill_in 'Date', with: '12/1/2022'
    fill_in 'Start', with: '18:00'
    check @user2.name.to_s
    check @user3.name.to_s
    check @user4.name.to_s
    click_on 'Create Party'
    # save_and_open_page

    expect(current_path).to eq("/users/#{@user1.id}/movies/550/viewing-party/new")
    expect(page).to have_content('Party duration must be greater than movie runtime')
  end
end
