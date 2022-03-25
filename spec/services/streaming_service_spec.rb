require 'rails_helper'
RSpec.describe StreamingService do
  it 'returns a hash of streaming data', :vcr do
    stream = StreamingService.link("tt6264654")

    expect(stream).to be_a Hash
    expect(stream).to have_key(:originalTitle)
    expect(stream).to have_key(:cast)
    expect(stream).to have_key(:streamingInfo)
    expect(stream).to have_key(:year)
  end
end
