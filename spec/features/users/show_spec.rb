require 'rails_helper'

RSpec.describe 'User Dashboard' do 
  
  it 'when I visit (/users/:id), I should see <user_name>s Dashboard at top of page' do 
    user1 = User.create!(name: "Kevin", email: "kta@turing.edu")
    user2 = User.create!(name: "Bryan", email: "bkeener@turing.edu")
    visit user_path(user1)
    
    expect(page).to have_content("Kevin's Dashboard")
    expect(page).to_not have_content(user1.email)
    expect(page).to have_link('Home')
    expect(page).to_not have_content("Bryan's Dashboard")
    expect(page).to_not have_content(user2.email)
  end

  it 'has a button that will take you to a movies discover page' do 
    user1 = User.create!(name: "Kevin", email: "kta@turing.edu")
    
    visit user_path(user1)

    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")
    
    expect(current_path).to eq(user_discovers_path(user1))
  end

  it 'has a section that lists viewing parties' do 
    user1 = User.create!(name: "Kevin", email: "kta@turing.edu")
    
    visit user_path(user1)

    expect(page).to have_content("Current Viewing Parties")
  end
end