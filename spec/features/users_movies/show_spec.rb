require 'rails_helper'
  RSpec.describe 'The User Movie Show Page' do 
    it 'displays a movies title, vote_average, runtime, genre and summary' do 
      user = User.create!(name: 'user', email: 'email')

      VCR.use_cassette('movie_title') do 
        visit "/users/#{user.id}/movies/24126/"
        within '#info' do 
          expect(page).to have_content('Warlock: The Armageddon')
          expect(page).to have_content('5.2')
          expect(page).to have_content('1 hour(s) 38 minutes')
          expect(page).to have_content('Fantasy')
          expect(page).to have_content('Horror')
          expect(page).to have_content('Science Fiction')
          expect(page).to have_content('Every six hundred years, a great evil has the opportunity to escape and unleash Armageddon. A group of five stones has the power to either free the evil, or banish it for another six hundred years. An order of Druids battles with a Warlock determined to unleash his father upon the world.')
      end
    end
  end 

  it 'displays the first 10 cast members name/character' do 
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('cast') do 
      visit "/users/#{user.id}/movies/24126/"
      within '#cast' do
        expect(page).to have_content('Cast')
        expect(page).to have_content('Julian Sands')
        expect(page).to have_content('Warlock')
        expect(page).to have_content('Name: Paula Marshall')
        expect(page).to have_content('Character: Samantha Ellison')
      end 
    end 
  end 

  it 'displays review information' do 
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('reviews_in_view') do 
      visit "/users/#{user.id}/movies/278/"
      within '#reviews' do
        expect(page).to have_content('Author Name: elshaarawy')
        expect(page).to have_content('Review: Make way for the best film ever made people. **Make way.**')
        expect(page).to have_content('Rating: 6.0')
        expect(page).to have_content('Author Handle: thommo_nz')
        expect(page).to have_content('Review Count: There are 7 reviews for The Shawshank Redemption')
      end 
    end 
  end 
end

