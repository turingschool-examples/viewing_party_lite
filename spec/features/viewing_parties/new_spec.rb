require 'rails_helper'

RSpec.describe 'New Viewing Party' do
  it 'displays a form to create a new viewing party', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: "password")
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: "password")

    visit new_user_movie_viewing_party_path(user1, 278)

    expect(page).to have_content('Create a Movie Party for The Shawshank Redemption')
    expect(page).to have_field('Duration of Party:', with: 142)
    expect(page).to have_field('Date:')
    # save_and_open_page
    expect(page).to have_button('Create Party')
    fill_in 'Date', with: Date.today + 1
    select ("02 PM", "00", :from => :starttime)
    check "#{user2.name} (#{user2.email})"
    check "#{user3.name} (#{user3.email})"
    click_button 'Create Party'

    expect(current_path).to eq "/users/#{user1.id}/discover"
  end
end
