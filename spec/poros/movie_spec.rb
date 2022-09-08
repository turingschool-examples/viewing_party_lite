require "rails_helper"

RSpec.describe Movie do
    it "exists" do
        data1 = {
            id: 12,
            title: "King Kong",
            runtime:  180,
            vote_average: 6.6,
            genres: [
            {
                name: "Comedy"
            },
            {
                name: "Drama"
            },
            {
                name: "Fantasy"
            }
        ],
            overview: "Big dino goes crazy"
        }

        data2 = {
        cast: [
            {
                name: 'Tim Robbins',
                character: 'Andy Dufresne'
            },
            {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            }]
        }

        data3 = {
        results: [{
                author: 'Erick Cabral',
                content: "Insane movie!"
            },
            {
                author: 'CinemaSerf',
                content: "Ving Rhames!"
            }],
        total_results: 2
    }

    movie = Movie.new(data1, data2, data3)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(12)
    expect(movie.title).to eq("King Kong")
    expect(movie.runtime).to eq(180)
    expect(movie.vote_average).to eq(6.6)
    expect(movie.genres).to eq(["Comedy", "Drama", "Fantasy"])
    expect(movie.summary).to eq("Big dino goes crazy")
    expect(movie.cast).to eq(["Tim Robbins as Andy Dufresne", "Morgan Freeman as Ellis Boyd Redding"])
    expect(movie.review_count).to eq(2)
    expect(movie.reviews).to eq({"CinemaSerf"=>"Ving Rhames!", "Erick Cabral"=>"Insane movie!"})
  end

  it "has a top 10 cast method" do
        data1 = {
            id: 12,
            title: "King Kong",
            runtime:  180,
            vote_average: 6.6,
            genres: [
            {
                name: "Comedy"
            },
            {
                name: "Drama"
            },
            {
                name: "Fantasy"
            }
        ],
            overview: "Big dino goes crazy"
        }

        data2 = {
        cast: [
            {
                name: 'Tim Robbins',
                character: 'Andy Dufresne'
            },
            {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            },
        {
                name: 'Morgan Freeman',
                character: 'Ellis Boyd Redding'
            }]
        }

        data3 = {
        results: [{
                author: 'Erick Cabral',
                content: "Insane movie!"
            },
            {
                author: 'CinemaSerf',
                content: "Ving Rhames!"
            }],
        total_results: 2
    }

    movie = Movie.new(data1, data2, data3)

    expect(movie.first_10_cast.class).to eq(Array)
    expect(movie.first_10_cast.count).to eq(10)
    
  end

end 