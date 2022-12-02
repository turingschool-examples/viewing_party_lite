require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe 'class methods' do 
    # describe '#movie_title(movie_id)' do 
    #   it '- returns the movie title of a given movie id' do
    #     expect(MovieFacade.movie_title(550)).to eq("Fight Club")
    #   end
    # end

    # describe '#movie_image(movie_id)' do
    #   it '- returns the movie image of a given movie id' do
    #     expect(MovieFacade.movie_image(550)).to eq("/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg")
    #   end
    # end

    describe '#movie_details(movie_id)' do
      it '- creates a new movie poro' do
        movie_details = MovieService.movie_details(550)
        movie_reviews = MovieService.movie_reviews(550)
        movie_credits = MovieService.movie_credits(550) 
        expect(MovieFacade.movie_details(550)).to be_a(Movie)
      end
    end

    # describe '#vote_average(movie_id)' do
    #   it '- returns the vote average of a given movie id' do
    #     expect(MovieFacade.vote_average(550)).to eq(8.428)
    #   end
    # end

    # describe '#runtime(movie_id)' do
    #   it '- returns the runtime in hours & minutes of a given movie id' do
    #     expect(MovieFacade.runtime(550)).to eq(139)
    #   end
    # end

    # describe '#genres(movie_id)' do
    #   it '- returns the genres associated to a given movie id' do
    #     expect(MovieFacade.genres(550)).to eq(["Drama", "Thriller", "Comedy"])
    #   end
    # end

    # describe '#summary_description(movie_id)' do
    #   it '- returns the summary description of a given movie id' do
    #     expect(MovieFacade.summary_description(550)).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
    #   end
    # end

    # describe '#first_10_cast_members(movie_id)' do
    #   it '- returns a list of the first 10 cast members (characters & actors)' do
    #     expect(MovieFacade.first_10_cast_members(550)).to eq([["Edward Norton", "The Narrator"],
    #                                                           ["Brad Pitt", "Tyler Durden"],
    #                                                           ["Helena Bonham Carter", "Marla Singer"],
    #                                                           ["Meat Loaf", "Robert \"Bob\" Paulson"],
    #                                                           ["Jared Leto", "Angel Face"],
    #                                                           ["Zach Grenier", "Richard Chesler"],
    #                                                           ["Holt McCallany", "The Mechanic"],
    #                                                           ["Eion Bailey", "Ricky"],
    #                                                           ["Richmond Arquette", "Intern"],
    #                                                           ["David Andrews", "Thomas"]])
    #   end
  #   end

  #   describe '#total_reviews(movie_id)' do
  #     it '- returns a count of the total reviews of a given movie id' do
  #       expect(MovieFacade.total_reviews(550)).to eq(7)
  #     end
  #   end

  #   describe '#review_info(movie_id)' do 
  #     it '- returns each reviews author and information' do
  #       expect(MovieFacade.review_info(550)[1]).to eq({
  #         "author": "Brett Pascoe",
  #         "author_details": {
  #             "name": "Brett Pascoe",
  #             "username": "SneekyNuts",
  #             "avatar_path": "/https://www.gravatar.com/avatar/04d45e186650672a416315dac947b3d6.jpg",
  #             "rating": 9.0
  #         },
  #         "content": "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again.",
  #         "created_at": "2018-07-05T13:22:41.754Z",
  #         "id": "5b3e1ba1925141144c007f17",
  #         "updated_at": "2021-06-23T15:58:10.199Z",
  #         "url": "https://www.themoviedb.org/review/5b3e1ba1925141144c007f17"
  #     })
  #     end
  #   end
  end
end