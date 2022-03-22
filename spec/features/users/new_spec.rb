require 'rails_helper'

RSpec.describe 'The new user view/form' do 
  it 'has a form a user can fill out to register' do
    visit register_path
 
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'User@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')

    expect(current_path).to eq(user_path(User.last))
    expect(User.first.name).to eq('Plain Name')
  end 
end 