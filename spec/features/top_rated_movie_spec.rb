require 'rails_helper'
require 'faker'

RSpec.describe 'Top Rated Movies' do
  it 'allows user to see first page of top rated movies', :vcr do
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    visit "/users/#{user1.id}/movies?q=top%20rated"

    expect(page.status_code).to eq 200
    expect(page).to have_content("Senator Bernard Sanders was found!")
    expect(page).to have_content("SenSanders")
  end
end