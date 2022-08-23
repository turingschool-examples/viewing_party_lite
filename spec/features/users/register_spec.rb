require 'rails_helper'

RSpec.describe 'register page' do
  before(:each) do
    visit '/register'
  end

  it "has a form with name and email fields and a register button" do
    fill_in('Name'), with: 'TestUser'
    fill_in('E-mail'), with: 'TestUser@gmail.com'
    click_button('Register')
    expect(current_path).to be("/users/#{Users.all.last.id}")
    expect(page).to have_content("TestUser")
    expect(page).to have_content("TestUser@gmail.com")
  end
end
