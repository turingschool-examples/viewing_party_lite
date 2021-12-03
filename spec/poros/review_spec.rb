require 'rails_helper'

RSpec.describe Review do
  it 'has attributes' do
    reviews = review_data[:results].map do |data|
      Review.new(data)
    end

    expect(reviews.first.author).to eq('futuretv')
    expect(reviews.first.content).to be_a(String )
  end
end
