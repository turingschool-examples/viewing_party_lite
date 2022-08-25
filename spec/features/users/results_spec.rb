require 'rails_helper' 

RSpec.describe 'ResultsPage' do 
  it 'shows the Top Movies' do 
    visit 'users/:user_id/movies?q=top%20rated'

    expect(page).to have_content 'Top Rated Movies'

    expect(page).to have_content 'The Shawshank Redemption'
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content 'दिलवाले दुल्हनिया ले जायेंगे'
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content "The Godfather"
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content "Schindler's List"
    expect(page).to have_content 'Vote Average: 8.6'
  end
end