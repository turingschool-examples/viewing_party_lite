require 'rails_helper'

RSpec.describe 'the User show page' do
  it 'shows the users name at the top of the page' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: "password")
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: "password")

    visit user_path(user1)

    expect(page).to have_content("Geraldo's Dashboard")
  end

  it 'should have a button to discover movies' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")

    visit user_path(user1)

    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")

    expect(current_path).to eq "/users/#{user1.id}/discover"
  end

  it 'has a section that displays viewing parties hosted by the user', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: "password")
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: "password")

    visit new_user_movie_viewing_party_path(user1, 278)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_ids_#{user2.id}")

    click_button 'Create Party'

    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to have_content(Date.tomorrow.strftime('%B %e, %Y'))
    # expect(page).to have_content(Time.strftime('%I:%M %p'))
    expect(page).to have_content('Hosting')
  end

  it 'displays viewing parties which the user is invited', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: "password")
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: "password")

    visit new_user_movie_viewing_party_path(user2, 238)

    fill_in 'Duration of Party:', with: 180
    fill_in 'Date', with: Date.tomorrow
    fill_in 'Start Time', with: Time.now + 600

    check("attendees_ids_#{user1.id}")

    click_button 'Create Party'

    visit user_path(user1)

    expect(page).to have_content('The Godfather')
    expect(page).to have_content(Date.tomorrow.strftime('%B %e, %Y'))
    # expect(page).to have_content(Time.strftime('%I:%M %p'))
    expect(page).to have_content('Invited')
  end
end
