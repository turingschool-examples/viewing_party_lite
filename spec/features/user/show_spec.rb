require 'rails_helper'

RSpec.describe 'User Dashboard' do
  let(:user) { User.create!(name: 'Tom', email: 'user@email.com') }

  before do
    visit user_path(user)
  end
  it 'should have a title on the top of the page' do
    expect(page).to have_content("Tom's Dashboard")
  end

  it 'should have a button to discover movies' do
    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_path(user))
  end

  it 'should have a section to display Viewing Parties' do
    expect(page).to have_content('Viewing Parties')
  end
end