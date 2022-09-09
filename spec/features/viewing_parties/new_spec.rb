require 'rails_helper'

RSpec.describe 'New Viewing Party' do
  it 'displays a form to create a new viewing party', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit new_movie_viewing_party_path(278)

    expect(page).to have_content('Create a Movie Party for The Shawshank Redemption')
    expect(page).to have_field('Duration of Party:', with: 142)
    expect(page).to have_field('Date:')
    expect(page).to have_field('Start Time:')
    expect(page).to have_button('Create Party')
    expect(page).to_not have_content('Geraldo (geraldo@trashtv.com)')

    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_ids_#{user2.id}")
    check("attendees_ids_#{user3.id}")

    click_button 'Create Party'

    expect(current_path).to eq(dashboard_path)
  end
end
