require 'rails_helper'

RSpec.describe 'Register Page' do
  before :each do
    @user1 = User.create(name: 'Jake', email: 'imjakekim@gmail.com')
    @user2 = User.create(name: 'Riley', email: 'rileybmccullough@gmail.com')
  end

  it 'has fields to fill' do
    visit register_path

    expect(page).to have_field('name')
    expect(page).to have_field('email')
  end

  it 'can create new user' do
    visit register_path
    # save_and_open_page
    fill_in 'Name', with: 'Jimmy'
    fill_in 'Email', with: 'JimmyJohns@gmail.com'
    click_on 'Create New User'

    user = User.find_by(email: 'JimmyJohns@gmail.com')
    expect(current_path).to eq("/users/#{user.id}")
  end

  it 'cannot reuse emails' do
    visit register_path

    fill_in 'Name', with: 'Jimmy'
    fill_in 'Email', with: 'imjakekim@gmail.com'
    click_on 'Create New User'

    expect(User.find_by(name: 'Jimmy', email: 'imjakekim@gmail.com')).to eq(nil)
    expect(current_path).to eq(register_path)
  end

  it 'cannot create user without name' do
    visit register_path

    fill_in 'Email', with: 'imjakekim@gmail35.com'
    click_on 'Create New User'

    expect(User.find_by(email: 'imjakekim@gmail35.com')).to eq(nil)
    expect(current_path).to eq(register_path)

  end
end
