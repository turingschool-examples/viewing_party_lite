require 'rails_helper'

RSpec.describe MovieFacade do
  it 'creates a MovieResults poro from top rated call', :vcr do
    top_rated = MovieFacade.create_top_rated

    expect(top_rated[0]).to be_an_instance_of(MovieResult)
  end

  it 'creates a MovieResults poro from keyword call', :vcr do
    keywords = 'howl'
    movie_by_keyword = MovieFacade.create_by_keyword(keywords)

    expect(movie_by_keyword[0]).to be_an_instance_of(MovieResult)
  end

  it 'creates a MovieDetails poro from details call', :vcr do
    id = 465
    movie_details = MovieFacade.create_movie_details(id)

    expect(movie_details).to be_an_instance_of(MovieDetails)
  end

  it 'creates a CastMember poro from create cast call', :vcr do
    id = 238
    cast_member = MovieFacade.create_cast(id)

    expect(cast_member[0]).to be_an_instance_of(CastMember)
    expect(cast_member).to be_a(Array)
    expect(cast_member.length).to be(10)
  end 
end
