require 'rails_helper'

RSpec.describe 'New Viewing Party' do
  let!(:users) { create_list(:user, 4) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }
  let!(:user4) { users.fourth }

  it 'displays a form to create a new viewing party', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit new_movie_viewing_party_path(278)

    expect(page).to have_content('Create a Movie Party for The Shawshank Redemption')
    expect(page).to have_field('Duration of Party:', with: 142)
    expect(page).to have_field('Date:')
    expect(page).to have_field('Start Time:')

    within("#invite_others") do
      expect(page).to have_field("attendees_#{user2.id}", unchecked: true) # checked: false or unchecked: true for not checked
      expect(page).to have_content("#{user2.name} (#{user2.email})")
      expect(page).to have_field("attendees_#{user3.id}", unchecked: true) # checked: false or unchecked: true for not checked
      expect(page).to have_content("#{user3.name} (#{user3.email})")
      expect(page).to have_field("attendees_#{user4.id}", unchecked: true) # checked: false or unchecked: true for not checked
      expect(page).to have_content("#{user4.name} (#{user4.email})")
      expect(page).to_not have_field("attendees_#{user1.id}")
      expect(page).to_not have_content("#{user1.name} (#{user1.email})")
    end

    expect(page).to have_button('Create Party')

    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_#{user2.id}")
    check("attendees_#{user3.id}")

    click_button 'Create Party'

    expect(current_path).to eq(dashboard_path)
  end
end
