require 'rails_helper'

RSpec.describe 'Discover Page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  it 'has a button to find top rated movies' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit discover_path

    expect(page).to have_button 'Find Top Rated Movies'
  end

  it 'can search by movie title' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit discover_path

    expect(page).to have_button 'Find Top Rated Movies'
  end
end
