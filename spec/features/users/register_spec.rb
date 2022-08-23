require 'rails_helper'

RSpec.describe 'register page' do
  before(:each) do
    visit '/register'
  end

  it "has a form with name and email fields and a register button" do
    fill_in 'Name' , with: 'TestUser'
    fill_in 'E-mail', with: 'TestUser@gmail.com'
    click_button('Register')
    expect(page).to have_content("TestUser")
  end
end
