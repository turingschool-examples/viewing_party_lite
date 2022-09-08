require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'takes you to a User show page when the correct credentials are entered' do
    user1 = User.create!( name: "James Franco", 
                          email: "movieman@gmail.com", 
                          password: "ayyy",
                          password_confirmation: "ayyy"
                        )

    visit login_path

    fill_in "Email:", with: user1.email
    fill_in "Password:", with: user1.password

    click_on "Log In"

    expect(current_path).to eq user_path(user1)
    expect(page).to have_content "Welcome back, #{user1.name}!"
  end

  it 'gives an error message and renders the log in page if invalid credentials' do
    user1 = User.create!( name: "James Franco", 
                          email: "moviemannn@email.com", 
                          password: "ayyy",
                          password_confirmation: "ayyy"
                        )

    visit login_path

    fill_in "Email:", with: user1.email
    fill_in "Password:", with: 'wrong password'

    click_on "Log In"

    expect(current_path).to eq login_path
    expect(page).to have_content "Username or password are not correct."
  end
end