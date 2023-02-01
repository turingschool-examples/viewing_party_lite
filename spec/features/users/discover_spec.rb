require 'rails_helper'

RSpec.describe 'User Discover Movies Page' do 

  let!(:charlie) { User.create!(name: 'Charlie', email: 'charlie_boy@gmail.com') }

  it 'redirects to movies results page (movies index)' do 
    visit discover_user_path(charlie) 

    click_button "Top Movies"

    expect(current_path).to eq "/users/#{charlie.id}/movies"
  end

  xit 'redirects to movies results page (movies index)' do 
    visit discover_user_path(charlie) 

    click_button "Search"

    expect(current_path).to eq "/users/#{charlie.id}/movies"
  end
end