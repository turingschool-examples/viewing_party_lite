require 'rails_helper'

RSpec.describe 'Landing Page', type: :feature do
  let!(:user1) { value1 = FactoryBot.create(:user) }
  let!(:user2) { value2 = FactoryBot.create(:user) }
  let!(:user3) { value3 = FactoryBot.create(:user) }
  
  before(:each) do
    visit '/'
  end

  it 'should list the title of the application' do
    expect(page).to have_link('Viewing Party!')
  end

  it 'should have a button to create a new user' do
    expect(page).to have_link('Create User')
  end

  it 'should have a  list of existing users' do
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)
  end

  it 'should have a link to go back to the landing page at the top of the page' do
    expect(page).to have_link('Viewing Party!', href: '/')
  end
end
#  Title of Application
#  Button to Create a New User
#  List of Existing Users which links to the users dashboard
#  Link to go back to the landing page (this link will be present at the top of all pages)