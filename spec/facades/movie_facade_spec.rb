require "rails_helper"

describe MovieFacade do
  context "class methods" do
    context "#search_results" do
      it "returns a max of 40 movie poros", :vcr do
        results = MovieFacade.search_results("the")
        expect(results.first).to be_a Movie
        expect(results.length).to eq(40)
      end
    end

    context "#top_20" do
      it "returns top 20 movie poros", :vcr do
        results = MovieFacade.top_20
        expect(results.first).to be_a Movie
        expect(results.length).to eq(20)
      end
    end

    context "#details" do
      it "returns one movie poro with complete details", :vcr do
        barton_fink = MovieFacade.details(290)

        expect(barton_fink.id).to eq(290)
        expect(barton_fink.title).to eq("Barton Fink")
        expect(barton_fink.vote_average).to eq(7.5)
        expect(barton_fink.genres).to be_a Array
        expect(barton_fink.genres[0]).to be_a Hash
        expect(barton_fink.genres[0][:name]).to eq("Comedy")
        expect(barton_fink.genres[1][:name]).to eq("Drama")
        expect(barton_fink.genres[2][:name]).to eq("Crime")
        expect(barton_fink.runtime).to eq(117)
        expect(barton_fink.summary).to eq("A renowned New York playwright is enticed to California to write for the movies and discovers the hellish truth of Hollywood.")
      end
    end

    context "cast_members" do
      it "returns a max of 10 CastMember POROs", :vcr do
        cast = MovieFacade.cast_members(290)

        expect(cast).to be_a Array
        expect(cast[0]).to be_a CastMember
        expect(cast.length).to eq(10)
      end
    end

    context "#reviews" do
      it "returns movie reviews", :vcr do
        results = MovieFacade.reviews(100)
        expect(results.first).to be_a Review
        expect(results.first.author).to eq("BradFlix")
        expect(results.first.content).to eq("I just plain love this movie!")
      end
    end
  end
end
