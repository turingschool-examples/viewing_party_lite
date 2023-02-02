require 'rails_helper'

RSpec.describe 'movies show page' do
  before(:each) do
    @user1   = create(:user)
    @movie1  = MovieFacade.top_rated[0]
    @cast1   = MovieFacade.cast(@movie1.id)
    @review1 = MovieFacade.reviews(@movie1.id)

    visit user_movie_path(@user1, @movie1.id)
  end

  describe 'When I visit a movie\'s detail page (/users/:user_id/movies/:movie_id)' do
    it 'should display a button to create a viewing party' do
      expect(page).to have_button('Create Viewing Party')
    end

    xit 'the viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)' do
      click_on('Create Viewing Party')

      expect(page).to eq("New Viewing Party")
    end

    it 'should display a button to return to the Discover Page Details' do
      expect(page).to have_button('Discover Page Details')
    end
    
    it 'should list movie details: Title' do
      expect(page).to have_content(@movie1.original_title)
    end
    
    it 'should list movie details: Vote Average' do
      expect(page).to have_content(@movie1.vote_average)
    end

    it 'should list movie details: Runtime' do
      expect(page).to have_content(@movie1.runtime)
    end

    it 'should list movie details: Genre' do
      expect(page).to have_content(@movie1.genres)
    end

    it 'should list movie details: Summary' do
      expect(page).to have_content(@movie1.summary)
    end
    
    it 'should list movie details: First 10 Cast Members' do
      expect(page).to have_content(@cast1[0].name)
      expect(page).to have_content(@cast1[0].character)
      expect(page).to have_content(@cast1[1].name)
      expect(page).to have_content(@cast1[1].character)
    end

    it 'should list movie details: Count of Total Reviews' do
      expect(page).to have_content("Number of Reviews: #{@review1.length}")
    end

    it 'should list each review\'s author and information' do
      within('#reviews') do
        expect(page).to have_content(@review1[0].author)
        expect(page).to have_content("The Godfather Review by Al Carlson")
      end
    end
  end
end
