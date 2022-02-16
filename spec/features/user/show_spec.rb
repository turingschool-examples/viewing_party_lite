require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0) }
  let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0) }
  let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0) }

  xit 'should display the users name at the top of the page' do
    visit user_path(user_1)

    expect(page).to have_content(user_1.name)
  end

  xit 'can click a button to discover movies' do
    visit user_path(user_1)

    click_button 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(user_1))
  end

  xit 'has a viewing parties section' do
    visit user_path(user_1)

    expect(page).to have_content('Viewing Parties')
  end
end
