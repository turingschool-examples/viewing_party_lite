# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  it 'show me a users dashboard ' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')

    visit user_path(@user1.id)

    expect(page).to have_content("Jimar's Dashboard")
    expect(page).to_not have_content("NickT's Dashboard")

    expect(page).to have_content('Viewing Parties:')
    expect(page).to have_button('Discover Movies')
  end

  
end
