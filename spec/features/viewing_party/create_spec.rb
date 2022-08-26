require 'rails_helper'
require 'faker'

RSpec.describe 'user creation' do
  it 'renders the new form' do 
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
    user2 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    #This 320288 represents a movie_id
    visit "/users/#{user1.id}/movies/320288/viewing-party/new"

    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('Create a Movie Party for')
    expect(find('form')).to have_content('Movie Title')
    expect(find('form')).to have_content('Duration of Party')
    expect(find('form')).to have_content('Day')
    expect(find('form')).to have_content('Start Time')
    expect(page).to have_content('Invite Other Users')
    expect(page).to have_checked_field("#{user1.id}-checkbox")
    expect(page).to have_checked_field("#{user2.id}-checkbox")
    expect(page).to have_button('Create Party')
    expect(page).to have_button('Discover Page')
  end
end