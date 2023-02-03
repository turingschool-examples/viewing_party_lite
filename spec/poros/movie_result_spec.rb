require 'rails_helper'

RSpec.describe MovieResult do 
  it 'exists and has attributes' do 
    data = {
      "adult": false,
      "backdrop_path": "/faXT8V80JRhnArTAeYXz0Eutpv9.jpg",
      "genre_ids": [
          16,
          28,
          12,
          35,
          10751,
          14
      ],
      "id": 315162,
      "original_language": "en",
      "original_title": "Puss in Boots: The Last Wish",
      "overview": "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
      "popularity": 5032.178,
      "poster_path": "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
      "release_date": "2022-12-07",
      "title": "Puss in Boots: The Last Wish",
      "video": false,
      "vote_average": 8.6,
      "vote_count": 3032}
    
    movie = MovieResult.new(data)

    expect(movie).to be_an_instance_of(MovieResult)
    expect(movie.id).to eq(315162)
    expect(movie.title).to eq("Puss in Boots: The Last Wish")
    expect(movie.vote_average).to eq(8.6)
  end
end