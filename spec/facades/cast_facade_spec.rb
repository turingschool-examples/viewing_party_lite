require 'rails_helper'

RSpec.describe CastFacade do
  it 'can return a collection of cast objects' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348/credits?api_key=#{ENV['tmdb_api_key']}&language=en")
      .to_return(status: 200,
                 body: File.read('spec/fixtures/alien_credits.json'),
                 headers: {})

    cast = CastFacade.get(348)

    expect(cast).to be_a Array
    cast.each do |actor|
      expect(actor).to be_a Cast
    end
  end
end
