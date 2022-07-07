require 'rails_helper'

RSpec.describe 'user registration page' do
  it 'has a form that allows a user to input name and email' do
    visit '/register'

    fill_in('Name', with: 'Sylvester Tommy')
    fill_in('Email', with: 'birdsarentreal@gmail.com')

    click_on('Register')

    expect(current_path).to eq("/users/#{User.last.id}")
  end
end
