require 'rails_helper'

RSpec.describe '#create' do
  it 'can log a user in' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit login_path

    expect(page).to_not have_content('Logout')

    within '#form' do
      fill_in :email, with: jose.email
      fill_in :password, with: jose.password
      click_on 'Sign In'
    end

    expect(page).to have_content('Logout')
    expect(current_path).to eq(root_path)
  end
  it 'can reject a wrong attempt' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit login_path

    within '#form' do
      fill_in :email, with: jose.email
      fill_in :password, with: 'notit'
      click_on 'Sign In'
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Invalid Email or Password')
  end
end
