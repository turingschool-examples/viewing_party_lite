require 'rails_helper'

RSpec.describe 'User Dashboard/Show Page', type: :feature do

  it "user dashboard displays name and a has button to discover movies" do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_path(user.id)
    expect(page).to have_content("Badger's Dashboard") 
    click_button 'Discover Movies'
    expect(current_path).to eq(user_discover_index_path(user.id)) 
    expect(page).to have_content("Discover Movies") 
  end

  it "has a section that listing viewing parties" do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_path(user.id) 
    expect(page).to have_content("Viewing Parties") 
  end
  
end
