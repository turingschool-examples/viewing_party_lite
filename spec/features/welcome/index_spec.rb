require 'rails_helper'

RSpec.describe 'the welcome page' do
  it 'can Log in a user' do
    lama = User.create!(name: 'Happy Lama', email: 'Happy_Lama@example.com', password: 'happy1',
                        password_confirmation: 'happy1')
    visit root_path

    click_button 'I already have an account'
    expect(current_path).to eq(login_path)

    fill_in 'Email', with: lama.email
    fill_in 'Password', with: 'happy1'
    click_on 'Log In'
    expect(current_path).to eq(user_path(lama.id))
    expect(page).to have_content("#{lama.name}'s Dashboard")
  end
end
