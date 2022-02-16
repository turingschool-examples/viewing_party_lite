require 'rails_helper'

RSpec.describe 'viewing party homepage' do
  let!(:user_1) { User.create!(name: 'Alfred', email: 'alfred@butler.net', status: 0, password: 'mastermind123', password_confirmation: 'mastermind123') }
  let!(:user_2) { User.create!(name: 'Bruce', email: 'bruced@boss.net', status: 0, password: 'batcave123', password_confirmation: 'batcave123') }
  let!(:user_3) { User.create!(name: 'Oswald', email: 'oswald@cobblepot.gotham', status: 0, password: 'penguin123', password_confirmation: 'penguin123') }

  it 'should display all user emails', :vcr do
    visit '/'

    expect(page).to have_link("#{user_1.email}'s Dashboard")
    expect(page).to have_link("#{user_2.email}'s Dashboard")
    expect(page).to have_link("#{user_3.email}'s Dashboard")
  end

  it 'can click the user email link and be taken to the users dashboard page', :vcr do
    visit '/'

    click_link "#{user_1.email}'s Dashboard"

    expect(current_path).to eq(user_path(user_1))
  end

  it 'can click a button to create a new user', :vcr do
    visit '/'

    click_button 'Create a New User'

    expect(current_path).to eq('/register')
  end

  it 'can click the home link to be taken back to the home page', :vcr do
    visit '/'

    click_link 'Home'
    expect(current_path).to eq('/')
  end
  
  it 'can successfuly login a user' do 
    visit '/' 

    click_link 'Log In' 

    expect(current_path).to eq('/login')
  end
end
