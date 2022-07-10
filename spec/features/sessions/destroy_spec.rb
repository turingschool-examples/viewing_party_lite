require 'rails_helper'

RSpec.describe '#destroy' do
  it 'can log a user out' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit sign_in_path

    within '#form' do
      fill_in :email, with: jose.email
      fill_in :password, with: '111'
      click_on 'Sign In'
    end

    click_on 'Logout'

    expect(page).to_not have_content('Logout')
  end
end
