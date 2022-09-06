require 'rails_helper'

RSpec.describe 'discover page' do
  it 'has a button to find top rated movies' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit "users/#{user1.id}/discover"

    expect(page).to have_button 'Find Top Rated Movies'
  end

  it 'can search by movie title' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(name: 'Maury', email: 'maury@trashtv.com', password: 'password', password_confirmation: 'password')
    user3 = User.create!(name: 'Jenny', email: 'jenny@trashtv.com', password: 'password', password_confirmation: 'password')

    visit "users/#{user1.id}/discover"

    expect(page).to have_button 'Find Top Rated Movies'
  end
end
