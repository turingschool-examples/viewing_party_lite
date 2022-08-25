require 'rails_helper'

RSpec.describe MovieDetails do
  it "has lots of movie details" do
    data =  
  {
  
      "genres": [
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 18,
            "name": "Drama"
        }
      ],
      "id": 505,
      "overview": "A career criminal who has been deformed since birth is given a new face by a kindly doctor and paroled from prison. It appears that he has gone straight, but he is really planning his revenge on the man who killed his mentor and sent him to prison.",
      "runtime": 94,
      "title": "Johnny Handsome",
      "vote_average": 6.3,
      "vote_count": 199
      }

      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(505)
      expect(movie.title).to eq("Johnny Handsome")
      expect(movie.vote_average).to eq(6.3)
      # expect(movie.runtime).to eq(94)
      # expect(movie.vote_count).to eq(199)
  end
end