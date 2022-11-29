require 'rails_helper'

RSpec.describe 'discover movies page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")
    visit(user_discover_index_path(@user1.id))
  end
  it 'should have a button to discover top rated movies' do
    expect(page).to have_button("Discover Top Rated Movies")
    click_button "Discover Top Rated Movies"
    expect(current_path).to eq(user_movies_path(@user1.id))
  end
  it 'should have a form to search for movies by title' do
    expect(page).to have_field(:title)
    expect(page).to have_button("Search")
    # save_and_open_page
  end
end
