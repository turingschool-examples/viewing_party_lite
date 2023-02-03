require "rails_helper"

RSpec.describe "Movie PORO" do
  describe 'Attributes' do
    it 'Exits and has attributes' do
      movie = Movie.new({
        genres: [
            {
                id: 18,
                name: "Drama"
            },
            {
                id: 53,
                name: "Thriller"
            },
            {
                id: 35,
                name: "Comedy"
            }
        ],
        id: 550,
        overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
        poster_path: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
        runtime: 139,
        title: "Fight Club",
        vote_average: 8.432,
      })
      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(550) 
      expect(movie.title).to eq('Fight Club')
      expect(movie.genres).to be_a(Array)
      expect(movie.genres[0][:name]).to eq('Drama')
      expect(movie.runtime).to eq(139)
      expect(movie.overview).to be_a(String)
      expect(movie.overview).to include('A ticking-time-bomb insomniac')
      expect(movie.vote_average).to eq(8.432)

    end
  end

  describe '#runtime_to_hours' do
    it 'converts runtime to hrs and mins' do
      movie = Movie.new(runtime: 123)
  
      expect(movie.runtime_to_hours).to eq("2 hr 3 min")
    end
  end
end