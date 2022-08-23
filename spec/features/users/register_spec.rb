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

  it "won't let you register with an e-mail that is already connected to a registered account" do
    @user1 = User.create!(name: 'Cory', email: 'Cory@gmail.com')

    fill_in 'Name' , with: 'Cory'
    fill_in 'E-mail', with: 'Cory@gmail.com'
    click_button('Register')
    save_and_open_page
    expect(page).to have_content("This e-mail is already in use. Please use another.")
  end
end
