require 'rails_helper'

RSpec.describe 'user registration' do
  before(:each) do
    visit '/register'
  end

  it 'can register a new user' do
    User.delete_all

    fill_in 'name', with: 'Brian'
    fill_in 'email', with: 'Brian@gmail.com'
    click_on 'Register'

    expect(page).to have_content 'Brian'
    expect(page).to have_content 'Brian@gmail.com'
  end

  it 'doesnt register the user if email not unique' do
    user1 = create(:user, email: 'fakeemail@gmail.com')
    
    fill_in 'name', with: 'Brian'
    fill_in 'email', with: 'fakeemail@gmail.com'
    click_on 'Register'

    expect(current_path).to eq users_path
    expect(page).to have_content ('Email already in use')
  end
end