require 'rails_helper'

RSpec.describe "register page" do
  it 'has a form with fields to fill in' do
    visit register_path
    expect(page).to have_field("Name")
    expect(page).to have_field("Email")
    expect(page).to have_button("Create New User")
  end
  
  it 'takes user to new dashboard page where :id is id for new user created' do
    user1 = User.create!(name: "Dennis Franz", email: "dennis@aol.com")
    id = User.maximum(:id)
    # require 'pry'; binding.pry
    
    visit register_path
    
    fill_in "Name", with: "Ted Bundy"
    fill_in "Email", with: "ted@gmail.com"
    click_button "Create New User"
    
    save_and_open_page
    expect(current_path).to eq(user_path((user1.id)+1))
  end
end