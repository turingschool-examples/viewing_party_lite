require 'rails_helper'
require 'faker'

RSpec.describe 'user creation' do
  it 'renders the new form', :vcr do 
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
    user2 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    #This 320288 represents a movie_id
    visit "/users/#{user1.id}/movies/320288/viewing-party/new"
    
    within "#new_party_form" do
      expect(page).to have_content('Movie title')
      expect(page).to have_content('Duration of party')
      expect(page).to have_field('Duration of party', with: '114')
      expect(page).to have_content('Day')
      expect(page).to have_content('Start time')

      expect(page).to have_content("#{user1.name} #{user1.email}")
      expect(page).to have_content("#{user2.name} #{user2.email}")
    end 

    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('Create a Movie Party for Dark Phoenix')
    expect(page).to have_content('Invite Other Users')

    expect(page).to have_button('Create Party')
    expect(page).to have_button('Discover Page')
  end

  it 'redirects user to user dashboard and shows viewing party as hosted', :vcr do 
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
    user2 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    #This 320288 represents a movie_id
    visit "/users/#{user1.id}/movies/320288/viewing-party/new"
  
    fill_in('date', with: '12/30/21')
    fill_in('Start time', with: '7:00')

    check("#{user2.name}", allow_label_click: true)
    
    click_on('Create Party')

    expect(current_path).to eq("users/#{user1.id}")
  end
end
