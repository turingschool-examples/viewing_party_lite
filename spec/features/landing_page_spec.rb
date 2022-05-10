require 'rails_helper'

RSPec.describe 'The landing page' do
  before :each do
    @fred = User.create!(name: 'Fred Jonson', email: 'fred.jonson@gmail.com')
    @billy = User.create!(name: 'Billy Jones', email: 'billy.jones@gmail.com')
    @sammy = User.create!(name: 'Sammy Jones', email: 'sammy.jones@gmail.com')

    visit '/'
  end

  it 'has the name of the app' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has a link to register a new user' do
    click_button 'New User'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Register a new User')
  end

  it 'has a list of all existing users' do
    expect(page).to have_content('Billy Jones: billy.jones@gmail.com')
    expect(page).to have_content('Sammy Jones: sammy.jones@gmail.com')
    expect(page).to have_content('Fred Jonson: fred.jonson@gmail.com')
  end

  it 'user names are links to their dashboard' do
    click_link('Billy Jones')
    expect(current_path).to eq("/users/#{@billy.id}")

    visit '/'

    click_link('Fred Jonson')
    expect(current_path).to eq("/users/#{@fred.id}")
  end

  it 'has a link to the landing page' do
    click_link 'Landing Page'

    expect(current_path).to eq('/')
  end
end
