require 'rails_helper'

RSpec.describe "The Discover Movies Page" do
  before :each do
    @user = User.create!(name: "John Cena", email: "johnc@email.com")
  end

  it 'is accessed from a button on a users show page' do
    visit users_dashboard_path(@user)

    click_button "Discover Movies"

    expect(current_path).to eq(users_discover_index_path(@user))
  end

  it 'has a button to discover top rated movies' do

  end

  it 'has a text field to enter keywords to search by movie title and search button' do

  end
end