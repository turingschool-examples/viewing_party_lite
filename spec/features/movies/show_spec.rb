require 'rails_helper'

RSpec.describe "movies show page" do 
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")
  end

  it 'displays a movies information from multiple API calls on a movie show page' do 
    visit(user_discover_path(@steve))
    click_button("Find Top Rated Movies")
    # expect(current_path).to eq("users/#{@steve.id}/movies?q=top+rated")
    expect(page).to have_link("The Godfather")
    click_link "The Godfather"
    # expect(current_path).to eq("users/#{@steve.id}/movies/#{result[:id]}")
    expect(page).to have_content("Genre: [\"Drama\", \"Crime\"]")
    expect(page).to have_content("Vote: 8.715")

  end
end