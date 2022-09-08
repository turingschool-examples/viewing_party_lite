require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has button to create user' do
    visit root_path
    expect(page).to have_link('Register User')
    click_link 'Register User'
    expect(current_path).to eq(register_path)
  end
end
