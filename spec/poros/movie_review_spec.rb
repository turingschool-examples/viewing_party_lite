require 'rails_helper'
RSpec.describe MovieReview do
  it 'exists with attributes' do
    review_data = {
      author: 'MohamedElsharkawy',
      author_details: { name: '', username: 'MohamedElsharkawy', avatar_path: nil, rating: nil },
      content: 'The Dilwale Dulhania Le Jayenge is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best.',
      created_at: '2017-10-21T12:27:46.145Z',
      id: '59eb3d42925141565100e901',
      updated_at: '2021-06-23T15:58:01.939Z',
      url: 'https://www.themoviedb.org/review/59eb3d42925141565100e901'
    }
    review = MovieReview.new(review_data)
    expect(review).to be_a MovieReview
    expect(review.author).to eq('MohamedElsharkawy')
    expect(review.content).to eq('The Dilwale Dulhania Le Jayenge is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best.')
  end
end
