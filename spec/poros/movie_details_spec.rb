require "rails_helper"

RSpec.describe MovieDetails do
  it "exists" do
    attrs = {
      :genres=>[{:id=>18, :name=>"Horror"}, {:id=>18, :name=>"Thriller"}],
      :id=>405,
      :overview=> "This is the overview of the movie",
      :poster_path=>"a path string",
      :runtime=>145,
      :title=>"My Favorite Movie",
      :vote_average=>9.9,
      :credits=>
        {:cast=> [{ :name=>"Andrew Garfield", :character=>"Jeb"},
                  { :name=>"Sam Worthington", :character=>"Ron"}]
        },
      :reviews=>
        { :page=>1,
          :results=> [{:author=>"Blake", :content=>"This is Blake's review"},
                      {:author=>"Anna Marie", :content=> "This is Anna Marie's review"}]
        }
    }

    movie_details = MovieDetails.new(attrs)

    expect(movie_details).to be_a MovieDetails
    expect(movie_details.movie_id).to eq(405)
    expect(movie_details.title).to eq("My Favorite Movie")
    expect(movie_details.rating).to eq(9.9)
    expect(movie_details.runtime).to eq(145)
    expect(movie_details.genres).to eq(["Horror", "Thriller"])
    expect(movie_details.summary).to eq("This is the overview of the movie")
    expect(movie_details.reviews).to eq([["Blake", "This is Blake's review"], ["Anna Marie", "This is Anna Marie's review"]])
    expect(movie_details.cast).to eq([["Andrew Garfield", "Jeb"], ["Sam Worthington", "Ron"]])
    expect(movie_details.poster_path).to eq("a path string")
  end
end