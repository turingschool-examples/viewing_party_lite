require 'rails_helper'

RSpec.describe 'Login Page' do 
  let!(:user) { User.create!(name: 'Britney Spears', email: 'imfreee@gmail.com', password: 'itsbritneybitch', password_confirmation: 'itsbritneybitch') }

  before(:each) do 
    visit '/login'
  end

  it 'logs in user if correct credentials are given' do 
    fill_in 'Email:', with: 'imfreee@gmail.com'
    fill_in 'Password:', with: 'itsbritneybitch'
    click_button 'Log In'

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user.name}! You are now logged in")
  end

  it 'redirects to login page with error if incorrect credentials are given' do 
    fill_in 'Email:', with: 'imfreee@gmail.com'
    fill_in 'Password:', with: 'itaintbritneybitch'
    click_button 'Log In'

    expect(page).to have_content('Unrecognized email/password combination')
  end
end