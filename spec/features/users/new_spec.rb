# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the new user page' do
  it 'displays a form to register as a user' do
    visit register_path

    fill_in 'Name', with: 'Vivian'
    fill_in 'Email', with: 'viv1234@gmail.com'
    click_button 'Register'

    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'redirects to the register page if an email is not unique' do
    visit register_path

    fill_in 'Name', with: 'Vivian'
    fill_in 'Email', with: 'viv1234@gmail.com'
    click_button 'Register'

    visit register_path

    fill_in 'Name', with: 'V'
    fill_in 'Email', with: 'viv1234@gmail.com'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content('Error: Email has already been taken')
  end

  it 'redirects to the register page if any field is not filled in' do
    visit register_path

    fill_in 'Name', with: 'Vivian'
    click_button 'Register'

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Error: Email can't be blank")
  end
end
