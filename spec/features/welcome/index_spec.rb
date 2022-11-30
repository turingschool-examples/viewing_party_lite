require 'rails_helper'

RSpec.describe 'welcome index page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")
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
  it 'has a list of existing users' do
    expect(page).to have_content("Existing Users")
    expect(page).to have_content(@user1.name)
  end

  it 'which links to the users dashboard' do
    expect(page).to have_link("#{@user1.name}")
  end

  it 'includes a link to the landing page' do
    expect(page).to have_link("Home Page")
    click_link "Home Page"
    expect(current_path).to eq(root_path)
  end
end
