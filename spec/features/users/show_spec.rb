require 'rails_helper'

RSpec.describe 'users dashboard page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
  end
  
  it 'show the name of the user' do
    visit user_path(@user_1)

    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    visit user_path(@user_1)

    expect(page).to have_button("Discover Movies")
    
    click_on "Discover Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it 'has a section that lists the viewing parties' do
    visit user_path(@user_1)

    expect(page).to have_content("Viewing Parties")
  end
end