require 'rails_helper'

RSpec.describe 'Discover Movies Page' do 

  xit 'can return a list of the top 20 rated movies', :vcr do 
    user = User.create!(name: "Smudger", email: "imadog@mail.com", password: "steak", password_confirmation: "steak")

    visit '/login'
    fill_in 'Email', with: 'imadog@mail.com'
    fill_in 'Password', with: 'steak'
    click_on ('Submit')

    visit "/users"
    # visit "/users/#{user.id}"
    
    
    within '#top-movies' do
    expect(page).to have_button('Top Movies')
  end
    
    click_on 'Top Movies'
    expect(current_path).to eq("users/#{user.id}/movies?q=top%20rated")

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote Average: 8.7")
  end
end
