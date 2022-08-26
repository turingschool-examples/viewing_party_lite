require 'rails_helper'

RSpec.describe MoviePoros do
    it 'exists', :vcr do
        attributes = {:adult=>false,
            :backdrop_path=>"/bvpI11RJbE6lHSWCrhvNC1S1MtO.jpg",
            :genre_ids=>[16, 10751],
            :id=>12,
            :original_language=>"en",
            :original_title=>"Finding Nemo",
            :overview=>
             "Nemo, an adventurous young clownfish, is unexpectedly taken from his Great Barrier Reef home to a dentist's office aquarium. It's up to his worrisome father Marlin and a friendly but forgetful fish Dory to bring Nemo home -- meeting vegetarian sharks, surfer dude turtles, hypnotic jellyfish, hungry seagulls, and more along the way.",
            :popularity=>120.64,
            :poster_path=>"/eHuGQ10FUzK1mdOY69wF5pGgEf5.jpg",
            :release_date=>"2003-05-30",
            :title=>"Finding Nemo",
            :video=>false,
            :vote_average=>7.8,
            :vote_count=>16723}
        movie = MoviePoros.new(attributes)
        
        expect(movie).to be_a MoviePoros
        expect(movie.title).to eq("Finding Nemo")
        expect(movie.id).to eq(12)
        expect(movie.release_date).to eq("2003-05-30")
        expect(movie.overview).to eq("Nemo, an adventurous young clownfish, is unexpectedly taken from his Great Barrier Reef home to a dentist's office aquarium. It's up to his worrisome father Marlin and a friendly but forgetful fish Dory to bring Nemo home -- meeting vegetarian sharks, surfer dude turtles, hypnotic jellyfish, hungry seagulls, and more along the way.")
        expect(movie.image_url).to eq("/eHuGQ10FUzK1mdOY69wF5pGgEf5.jpg")
        expect(movie.average_rating).to eq(7.8)
    end
end