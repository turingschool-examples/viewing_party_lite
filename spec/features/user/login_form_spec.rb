require 'rails_helper'

RSpec.describe User: :LoginForm do

  it 'redirects to show page on successful login' do
    user1 = User.create!(name: 'Jim', email: 'Jimmyb@gmail.com', password: 'test123', password_confirmation: 'test123')

    visit login_path

    fill_in 'Email', with: user1.email.to_s
    fill_in 'Password', with: user1.password.to_s
    click_on 'Login'

    expect(current_path).to eq(user_path(user1.id))
  end

  it 'sad path' do
    user1 = User.create!(name: 'Jim', email: 'Jimmyb@gmail.com', password: 'test123', password_confirmation: 'test123')

    visit login_path

    fill_in 'Email', with: user1.email.to_s
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Credentials invalid')
  end

end
