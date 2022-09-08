# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'can list the title of the  application' do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('Create New User')
  end

  it 'has a link to return back to the landing/welcome page' do
    visit '/'

    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it 'as a visitor the section of the page that lists existing users is not visible unless logged in' do
    user1 = User.create!(name: 'Tarker Phompson', email: 'tarker@email.com', password: "pokemon", password_confirmation: "pokemon")
    user2 = User.create!(name: 'Eandace Cckels', email: 'eandace@email.com', password: "lit", password_confirmation: "lit")
    user3 = User.create!(name: 'Dhirley SeCesari', email: 'dhirleye@email.com', password: "crochet", password_confirmation: "crochet")
    user4 = User.create!(name: 'Sage Skaff', email: 'sage@email.com', password: "coder", password_confirmation: "coder")

    visit '/'

    expect(page).to have_link('Home')
    expect(page).to_not have_content('Tarker Phompson')
    expect(page).to_not have_content('tarker@email.com')
    expect(page).to_not have_content('Eandace Cckels')
    expect(page).to_not have_content('eandace@email.com')
    expect(page).to_not have_content('Dhirley SeCesari')
    expect(page).to_not have_content('dhirleye@email.com')
    expect(page).to_not have_content('Sage Skaff')
    expect(page).to_not have_content('sage@email.com')
  end

  it "list all existing users email addresses when registered" do 
    user1 = User.create!(name: 'Smudger', email: 'imadog@email.com', password: "steak", password_confirmation: "steak")
    user2 = User.create!(name: 'Nicholas', email: 'imagolfer@email.com', password: "golf", password_confirmation: "golf")
    user3 = User.create!(name: 'Oliver', email: 'imagamer@email.com', password: "nintendo", password_confirmation: "nintendo")

    visit '/login' 

    fill_in 'Email', with: 'imadog@email.com'
    fill_in 'Password', with: 'steak'
    click_on ('Submit')

    visit '/'

    expect(page).to have_content('imadog@email.com')
    expect(page).to have_content('imagolfer@email.com')
    expect(page).to have_content('imagamer@email.com') 
  end
end
