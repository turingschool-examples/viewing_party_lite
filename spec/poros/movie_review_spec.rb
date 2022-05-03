require "rails_helper"

RSpec.describe MovieReview do
  it "exists with attributes" do
    data = {
      :author => 'Opinionated Person',
      :content => 'Really Good',
      :author_details => 
      { 
        :username => 'OpinionatedPerson',
        :rating => 9
      }
    }

    review = MovieReview.new(data)
    expect(review).to be_an_instance_of(MovieReview)
    expect(review.name).to eq('Opinionated Person')
    expect(review.user_name).to eq('OpinionatedPerson')
    expect(review.content).to eq('Really Good')
    expect(review.rating).to eq(9)
  end
end