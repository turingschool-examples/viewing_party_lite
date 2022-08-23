require 'rails_helper'

RSpec.describe 'creating a new user' do
  it 'links to a form to create a new user' do
    user1 = User.create!(name: 'Geraldo Rivera', email: 'geraldo@trashtv.com')
    user2 = User.create!(name: 'Maury Povich', email: 'maury@trashtv.com')
    user3 = User.create!(name: 'Jenny Jones', email: 'jenny@trashtv.com')

    visit root_path

    click_button('New User')
    expect(current_path).to eq(register_path)

    fill_in 'Name', with: 'Jerry Springer'
    fill_in 'Email', with: 'jerry@trashtv.com'
    fill_in 'Password', with: 'guiltypleasure99'
    click_on 'Create Account'

    expect(page).to have_content("Jerry Springer's Dashboard")
  end
end
