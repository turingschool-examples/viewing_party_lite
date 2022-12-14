# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the home page' do
  before :each do
    @mostafa = User.create!(name: 'Mostafa', email: 'sasa2020@hotmail.com', password: "123", password_confirmation: '123')
    @yuji = User.create!(name: 'Yuji', email: 'jimmyboy@hotmail.com', password: "123", password_confirmation: '123')
    @bryan = User.create!(name: 'Bryan', email: 'breakingbad2020@hotmail.com', password: "123", password_confirmation: '123')
  end

  it "has the title 'Viewing Party'" do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it 'has a link at the top to go to Home Page' do
    visit '/'

    expect(page).to have_content('Home Page')
    click_on 'Home Page'
    expect(current_path).to eql('/')
  end

  it 'has a button to create a new user' do
    visit '/'

    expect(page).to have_button('Create New User')

    click_button 'Create New User'

    expect(current_path).to eql('/register')
  end


  it 'when a user is logged in ' do
    
    user = User.create(name: 'Meg', email: "email@email.com", password: "123", password_confirmation: '123')
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit '/'

    expect(page).to_not have_button("Log In")
    expect(page).to_not have_button("Create New User")

    click_button "Log Out"
    expect(current_path).to eq('/')
  end

  it 'A guest(not logged in user) goes to home page' do
    
    visit '/'

    expect(page).to have_button("Log In")
    expect(page).to have_button("Create New User")
  end

  it 'shows a list of existing users emails' do
    user = User.create(name: 'Meg', email: "email@email.com", password: "123", password_confirmation: '123')
    use2 = User.create(name: 'Meg', email: "meg@meg.com", password: "123", password_confirmation: '123')
      
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit '/'

    expect(page).to have_content("meg@meg.com")
  end
end
