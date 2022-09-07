require 'rails_helper'

RSpec.describe 'register page' do
  before(:each) do
    visit '/register'
  end

  it "has a form with name and email fields and a register button" do
    fill_in 'Name:' , with: 'TestUser'
    fill_in 'E-mail:', with: 'TestUser@gmail.com'
    fill_in 'Password:', with: '123'
    fill_in 'Confirm Password:', with: '123'

    click_button('Register')
    expect(page).to have_content("TestUser")
  end

  it "won't let you register with an e-mail that is already connected to a registered account" do
    @user1 = User.create!(name: 'Cory', email: 'Cory@gmail.com', password_digest: '123')

    fill_in 'Name' , with: 'Cory'
    fill_in 'E-mail', with: 'Cory@gmail.com'
    click_button('Register')
    expect(page).to have_content("This e-mail is already in use. Please use another.")
  end

  it "won't register a user if the password does not match the password confirmation" do
    fill_in 'Name:' , with: 'TestUser'
    fill_in 'E-mail:', with: 'TestUser@gmail.com'
    fill_in 'Password:', with: '123'
    fill_in 'Confirm Password:', with: 'abc'

    click_button('Register')
    expect(page).to have_content("Your password must match in both password fields.")
  end
end
