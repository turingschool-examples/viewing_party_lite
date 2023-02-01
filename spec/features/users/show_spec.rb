require 'rails_helper'

RSpec.describe 'Users Show' do
  let!(:user) { create(:user) }
  it 'Shows the user name' do
    visit user_path(user)

    expect(page).to have_content(user.name)
  end

  it 'it has a button to discover movies' do
    visit user_path(user)

    expect(page).to have_button('Discover Movies')
  end
end