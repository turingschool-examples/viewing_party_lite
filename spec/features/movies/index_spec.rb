require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  it 'shows the top 40 movies from the API', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    visit user_movies_path(user1)

    # Will need to finish this test at a later date
  end
end