require 'rails_helper'

RSpec.describe 'user discover movies page' do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
  end
  
  it 'has a button to discover top rated movies', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_button("Find Top Rated Movies")

    click_on "Find Top Rated Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end

  it 'has a text field to enter keywords and button to search by movie title', :vcr do
    visit user_discover_index_path(@user_1)

    expect(page).to have_field(:search)
    expect(page).to have_button("Find Movies")
    
    fill_in :search, with: "Nemo"
    click_on "Find Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end
end