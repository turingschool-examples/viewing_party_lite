require 'rails_helper'

RSpec.describe '#show' do
  it '#show page for movie', :vcr do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')
    
    visit user_movies_show_path(@jose, 500)

    expect(page).to have_content('Reservoir Dogs')
    expect(page).to have_content('Vote Average: 8.1')
    expect(page).to have_content('Runtime: 1 hour 39 minutes')
    expect(page).to have_content('Genres: Crime, Thriller')
    expect(page).to have_content('Description: A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.')
    expect(page).to have_content('Characters & Cast Members: - grab first 10 from end point')
    expect(page).to have_content('Total Reviews': reviews end point')
    expect(page).to have_content('Reviewers': ')
  end

  #tests for the buttons before
end
