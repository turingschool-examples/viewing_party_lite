require 'rails_helper'

RSpec.describe 'landing page' do
  it 'has the title of the app' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a button to create a new user' do
    visit '/'

    click_button('Create New User')

    expect(current_path).to eq('/register')
  end

  it 'has a list of existing users' do
    User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
    User.create!(name: 'Sarah Smallapoo', email: 'ssmallapoo@aol.com')
    User.create!(name: 'Godrick Mjordenstein', email: 'pickofthegods@aol.com')
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
