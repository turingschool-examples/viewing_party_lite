require 'rails_helper'

RSpec.describe MovieFacade do 
    before :each do 
        @moviefacade = MovieFacade.movie(402)
    end
    it 'will create a movie object', :vcr do 
        expect(@moviefacade).to be_a Movie
    end
    it 'will have all keys', :vcr do 
        expect(@moviefacade.duration).to eq("2 hour(s) and 7 minute(s)")
        expect(@moviefacade.genres).to eq([{:id=>53, :name=>"Thriller"}, {:id=>9648, :name=>"Mystery"}])
        expect(@moviefacade.imdb_id).to eq("tt0103772")
        expect(@moviefacade.minutes).to eq(127)
        expect(@moviefacade.poster_path).to eq("/76Ts0yoHk8kVQj9MMnoMixhRWoh.jpg")
        expect(@moviefacade.summary).to eq("A violent police detective investigates a brutal murder that might involve a manipulative and seductive novelist.")
        expect(@moviefacade.vote_average).to eq(6.9)
    end
    describe 'cast' do 
        before :each do 
            @cast = MovieFacade.cast(402)
        end
        it 'will create a CastMember object', :vcr do 
            expect(@cast.first).to be_a CastMember
        end
        it 'will have the character, name, and cast orer', :vcr do 
            expect(@cast.first.character).to eq('Det. Nick Curran')
            expect(@cast.first.name).to eq('Michael Douglas')
            expect(@cast.first.order).to eq(0)
        end
        it 'will only return 10 cast members', :vcr do 
            expect(@cast.count).to eq(10)
        end
    end
    describe 'reviews' do 
        before :each do 
            @reviews = MovieFacade.reviews(402)
        end
        it 'will return review values', :vcr do 
            expect(@reviews.first).to be_a(Review)
        end
        it 'will have an author and content', :vcr do 
            expect(@reviews.first.author).to be_a(String)
            expect(@reviews.first.author).to eq('talisencrw')
            expect(@reviews.first.content).to be_a(String)
            expect(@reviews.first.content).to eq("Controversy aside, in regards both to Sharon Stone's quintessentially-provocative noirish femme fatale (talk about a queen bee or alpha female!) and the backlash that the film portrayed lesbians as crazed psychos, Verhoeven both played a striking tribute to Sir Alfred Hitchcock, particularly San Francisco's based Vertigo and in use of the blonde bombshell, and simply continued his style of storytelling that had become his trademark in his pre-Hollywood, formative days in the Netherlands. Though it's not mentioned in the interviews of either star or director, the wonderful car chase brought to mind that 'other' car chase Frisco Bay movie, 'Bullitt'. But given the remarkable landscape of the area, why not? One would be a fool not to push the stylistic envelope as far as the censors will allow. A film that would have made The Master of Suspense proud, methinks, and one that he himself perhaps would have done, had Joe Eszterhas' very fun script been around, during, say, the time of 'Frenzy', when Hitchcock was at his cheekiest. A fantastic date movie too, by the way...")
        end
    end
end