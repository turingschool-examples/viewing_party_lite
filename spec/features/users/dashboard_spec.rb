require 'rails_helper'

RSpec.describe 'the user dashboard' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }

  it 'links to the user dashboard' do
    visit root_path

    click_link("#{user1.email}'s Dashboard")

    expect(current_path).to eq(user_dashboard_path(user1))
  end

  it 'displays username at the top of the page' do
    visit user_dashboard_path(user1)

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    visit user_dashboard_path(user1)

    expect(page).to have_button('Discover Movies')
  end

  it 'has a section tha lists viewing parties' do
    visit user_dashboard_path(user1)

    expect(page).to have_content('Viewing Parties')
  end
end
