# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User show page' do
  before :each do
    @user = User.create(name: 'Sunny', email: 'sunny@email.com')

    visit user_path(@user.id)
  end
  it 'has the users name at top' do
    expect(page).to have_content("Sunny's Dashboard Page")
  end
  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end
  it 'has a section for Viewing Parties' do
    expect(page).to have_content("Sunny's Viewing Parties")
  end
  it 'clicking discover movies takes me to the discover page' do
    click_on 'Discover Movies'

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it 'has a section that lists the viewing parties the user is invited to', vcr: 'movie_details' do
    @user1 = User.create!(name: "Mary", email: 'random_email@gmail.com')
    @user2 = User.create!(name: "Legolas", email: 'youhavemybow@gmail.com')
    @user3 = User.create!(name: "Gimli", email: 'andmyaxe@gmail.com')
    @party1 = Party.create!(duration: 170, start_time: '2022-10-31 11:30:00 UTC', movie_id: 123, movie_title: 'Spirited Away')
    @party2 = Party.create!(duration: 170, start_time: '2022-12-15 12:30:00 UTC', movie_id: 456, movie_title: 'The Dark Knight')
    @party1.users << @user1
    @party1.users << @user2
    @party1.users << @user3
    @party2.users << @user3
    @party2.users << @user2
    @party2.users << @user1

    expect(@party1.reload.host).to eq @user1
    expect(@party2.reload.host).to eq @user3

    visit user_path(@user1.id)

    within("#viewingparty-#{@party1.id}")
    expect(page).to have_content('Movie Title: Spirited Away')
    expect(page).to have_content("Host: Mary")
  end
end
