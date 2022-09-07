# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users registration page' do
  # it 'should have a form to enter name and email' do
  #   visit '/users/new'

  #   fill_in('Name', with: 'Nick')
  #   fill_in('email', with: '123@gmail.com')

  #   click_on('Create New User')

  #   expect(current_path).to eq("/users/#{User.last.id}")
  # end

  # it 'should only accept unique email addresses' do
  #   user_1 = User.create!(name: 'Mike', email: 'email@email.com')
  #   visit '/users/new'

  #   fill_in('Name', with: 'Nick')
  #   fill_in('email', with: 'Email@email.com')

  #   click_on('Create New User')

  #   expect(current_path).to eq('/users/new')
  # end

  it 'returns you to the new page if all details arent submitted' do
    visit '/register'

    fill_in('email', with: 'Email@email.com')

    click_on('Register New User')

    expect(page).to have_content('Error: Please fill in all fields. Email must be unique.')
    expect(current_path).to eq('/register')
  end

  it ' allows you to register a new user, with a name, email, password, and password confirmation' do
    visit '/register'
    fill_in('email', with: 'testemail4@email.com')
    fill_in('name', with: 'Test4')
    
    fill_in :password, with: ("password1")
    fill_in('Password Confirmation', with: 'password1')
    click_on('Register New User')
    user = User.last
    expect(current_path).to eq("/users/#{user.id}")
  end
end


# As a visitor 
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`