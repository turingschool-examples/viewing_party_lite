# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Party New Page', :vcr do
  it 'discover button' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')
    @user3 = User.create!(name: 'Frank', email: 'Franks@jimar.com')

    visit "/users/#{@user1.id}/movies/550/viewing-party/new"

    # save_and_open_page

    expect(page).to have_content("Fight Club")
    expect(page).to have_content("Duration: 139 minutes")

    fill_in 'Date', with: '12/1/2022'
    fill_in 'Start', with: '18:00'
    fill_in 'Duration', with: '18:00'
    fill_in 'Invite Other Users', with: "#{@user2.name}"
    click_on 'Create Party'

    expect(current_path).to eq("/users/#{@user1.id}/viewing-party/dashboard")
  end
end
