require 'rails_helper'

RSpec.describe 'Session Destroy' do
  it 'Destroys the session when a user clicks log out' do
    user1 = User.create!( name: "James Franco", 
                          email: "movieman@hotmail.com", 
                          password: "password7",
                          password_confirmation: "password7"
                        )

    visit login_path

    fill_in "Email:", with: user1.email
    fill_in "Password:", with: user1.password

    click_on "Log In"

    expect(current_path).to eq user_path(user1)
    expect(page).to have_content "Welcome back, #{user1.name}!"
  end
end