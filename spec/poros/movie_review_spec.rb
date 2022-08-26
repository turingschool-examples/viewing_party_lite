require 'rails_helper'

RSpec.describe MovieReview do
  describe '#attributes' do
    it 'exists and has attributes' do
      data = {
        author: "talisencrw",
        content: "This unique take on the heist-film-gone-wrong was excellent--stylish and intelligently made, yet very funny and inexpensive. Tarantino's accolades from giving American cinema the resuscitation it needed mirrors what has happened, at least since the 70's, with Martin Scorsese's 'Mean Streets', both in terms of entertaining violence and usage of music in the scoring of films. I greatly thank Harvey Keitel for taking a chance on Tarantino back then--It paid off in spades."
      }

      review = MovieReview.new(data)

      expect(review).to be_a(MovieReview)
      expect(review.author).to eq("talisencrw")
      expect(review.content).to eq(
        "This unique take on the heist-film-gone-wrong was excellent--stylish and intelligently made, yet very funny and inexpensive. Tarantino's accolades from giving American cinema the resuscitation it needed mirrors what has happened, at least since the 70's, with Martin Scorsese's 'Mean Streets', both in terms of entertaining violence and usage of music in the scoring of films. I greatly thank Harvey Keitel for taking a chance on Tarantino back then--It paid off in spades."
      )
    end
  end
end