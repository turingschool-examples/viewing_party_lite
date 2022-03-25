require 'rails_helper'
RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '#movie_reviews' do
      it 'will return a specific movie review' do
        movie_objects = MovieFacade.movie_reviews(19404)
        movie_objects.each do |object|
          expect(object).to be_a MovieReview
          expect(object.author).to_not be_nil
          expect(object.content).to_not be_nil
        end 
      end
    end
  end
end
