require 'rails_helper'

RSpec.describe "Movie's detail page" do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)

    @movie_1 = Movie.create!(title: 'Harry Potter and The Chamber of Secrets', runtime: 161, genre: 'fantasy', summary: 'An ancient prophecy seems to be coming true when a mysterious presence begins stalking the corridors of a school of magic and leaving its victims paralyzed.' )

    visit "/users/#{@user_1.id}/movies/#{@movie_1.id}"
  end

  it 'has a button to create a viewing page' do
    expect(page).to have_button('Create a Viewing Party')

    click_button('Create a Viewing Party')
    expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie_1.id}/viewing-party/new")
  end
end