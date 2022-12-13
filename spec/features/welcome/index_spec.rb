require 'rails_helper'

RSpec.describe 'welcome index page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    visit(root_path)
  end
  it 'should include title of the application' do
    expect(page).to have_content("Viewing Party")
  end

  it 'should have a button to create a new user' do
    expect(page).to have_button("Create New User")
    click_button "Create New User"
    expect(current_path).to eq("/register")

  end
  xit 'has a list of existing users' do
    expect(page).to have_content("Existing Users")
    expect(page).to have_content(@user1.name)
  end

  xit 'which links to the users dashboard' do
    expect(page).to have_link("#{@user1.name}")
  end

  it 'includes a link to the landing page' do
    expect(page).to have_link("Home Page")
    click_link "Home Page"
    expect(current_path).to eq(root_path)
  end

  it 'I see a link for login' do 
    expect(page).to have_link("Login")
  end

  it 'when I click the link, I am taken to a login page where i input unique email and password' do 
    click_link "Login"
    expect(current_path).to eq(login_path)
  end

  it 'as a visitor, does not have a list of existing users' do
    expect(page).to_not have_content(@user1.name)
    expect(page).to_not have_content(@user2.name)
    expect(page).to_not have_content(@user3.name)
  end 
end
