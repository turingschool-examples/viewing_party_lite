require 'rails_helper'

RSpec.describe "log in page", type: :feature do

  it 'has a fillable email field' do
    visit login_path

    fill_in "Email", with: "fake-email@test.com"
  end

  it 'has a fillable password field' do
    visit login_path

    fill_in "Password", with: "password123"
  end

  it 'directs user to their dashboard if email and password pairing are valid' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com", password: "iluvmovies123", password_confirmation: "iluvmovies123")

    visit login_path

    fill_in "Email", with: "david-fake@test.com"
    fill_in "Password", with: "iluvmovies123"

    click_on "Log In"

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

  it 'returns an error if user email does not exist' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com", password: "iluvmovies123", password_confirmation: "iluvmovies123")

    visit login_path

    fill_in "Email", with: "BADBADdavid-fake@test.com"
    fill_in "Password", with: "iluvmovies123"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error: login failed")
  end

  it 'returns an error if password doesn\'t match' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com", password: "iluvmovies123", password_confirmation: "iluvmovies123")

    visit login_path

    fill_in "Email", with: "BADBADdavid-fake@test.com"
    fill_in "Password", with: "moviesAreStinky"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error: login failed")
  end

  it 'returns a complete-all-fields error if email left out' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com", password: "iluvmovies123", password_confirmation: "iluvmovies123")

    visit login_path

    fill_in "Password", with: "moviesAreStinky"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error: please fill in all fields")
  end

  it 'returns a complete-all-fields error if email left out' do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com", password: "iluvmovies123", password_confirmation: "iluvmovies123")

    visit login_path

    fill_in "Email", with: "BADBADdavid-fake@test.com"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error: please fill in all fields")
  end

end