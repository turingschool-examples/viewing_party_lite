require 'rails_helper'

RSpec.describe 'landing page' do
  before(:each) do
    visit '/'
  end

  it "displays the app title" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has a button to create a new user" do
    click_button('New User')
    expect(current_path).to eq('/users/new')
  end

  it "has a list of existing users and links to their dashboards" do
    @user1 = User.create(name: "Cory", email: '1@gmail.com' )
    @user2 = User.create(name: "John", email: '2@gmail.com' )

    within("#user_#{@user1.id}") do
      expect(page).to have_content("Cory")
      expect(page).to have_content("1@gmail.com")
      click_link('Cory')
      expect(current_path).to eq("/users/#{@user1.id}")
    end
    within("#user_#{@user2.id}") do
      expect(page).to have_content("John")
      expect(page).to have_content("2@gmail.com")
      click_link('John')
      expect(current_path).to eq("/users/#{@user2.id}")
    end
  end

  it "has a link to return to the landing page" do
    click_button('Landing Page')
    expect(current_path).to eq('/')
  end
end
