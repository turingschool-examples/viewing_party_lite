require 'rails_helper'

RSpec.describe 'Login Page' do
  it 'has email and password fields' do
    visit root_path
  
    click_on 'Log In'
    expect(current_path).to eq('/login')
  end
end