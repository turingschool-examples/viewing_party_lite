require "rails_helper"

describe MovieService do
  context "class methods" do
    context "#top_20" do
      it "lists 20 movies", :vcr do
        top_twenty = MovieService.top_20

        expect(top_twenty).to be_a Hash
        expect(top_twenty[:results]).to be_an Array
        expect(top_twenty[:results].first).to be_a Hash

        expect(top_twenty[:results].length).to eq(20)
      end
    end

    context "#search" do
      it "lists movies with similar names", :vcr do
        the = MovieService.search("the", 1)
        expected = the[:results].all? { |movie| movie[:title].downcase.include?("the") }

        expect(the).to be_a Hash
        expect(the[:results]).to be_an Array
        expect(the[:results].first).to be_a Hash

        expect(expected).to be true
      end
    end

    context "#details" do
      it "lists all of the complete details for some given movie", :vcr do
        barton_fink = MovieService.details(290)

        expect(barton_fink).to be_a Hash
        expect(barton_fink[:id]).to eq(290)
        expect(barton_fink[:title]).to eq("Barton Fink")
        expect(barton_fink[:vote_average]).to eq(7.5)
        expect(barton_fink[:genres]).to be_a Array
        expect(barton_fink[:genres][0]).to be_a Hash
        expect(barton_fink[:genres][0][:name]).to eq("Comedy")
        expect(barton_fink[:genres][1][:name]).to eq("Drama")
        expect(barton_fink[:genres][2][:name]).to eq("Crime")
        expect(barton_fink[:runtime]).to eq(117)
        expect(barton_fink[:overview]).to eq("A renowned New York playwright is enticed to California to write for the movies and discovers the hellish truth of Hollywood.")
      end
    end

    context "#cast_members" do
      it "returns all the cast members for a given movie", :vcr do
        cast = MovieService.cast_members(290)

        expect(cast).to be_a Hash
        expect(cast[:cast]).to be_a Array
        expect(cast[:cast][0]).to be_a Hash
        expect(cast[:cast][0][:character]).to eq("Barton Fink")
        expect(cast[:cast][0][:name]).to eq("John Turturro")
      end
    end
  end
end
