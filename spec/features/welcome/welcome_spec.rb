require 'rails_helper'

RSpec.describe 'landing page' do
  it 'has the title of the app' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('New User')
  end

  it 'has a list of existing users' do
    user1 = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
    user2 = User.create!(name: 'Sarah Smallapoo', email: 'ssmallapoo@aol.com')
    user3 = User.create!(name: 'Godrick Mjordenstein', email: 'pickofthegods@aol.com')
    visit '/'

    expect(page).to have_link('Tommy Tanktop')
    expect(page).to have_link('Sarah Smallapoo')
    expect(page).to have_link('Godrick Mjordenstein')
  end

  it 'has a link to return to the landing page' do
    visit '/'

    click_link('Landing Page')

    expect(current_path).to eq('/')
  end
end
