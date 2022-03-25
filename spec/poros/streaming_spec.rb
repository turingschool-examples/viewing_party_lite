require 'rails_helper'

RSpec.describe Streaming do
  it 'exists' do
    data = [:disney, {:us=>{:link=>"https://www.disneyplus.com/movies/-/3qBd6ESjzQOm", :added=>1645683871, :leaving=>0}}]
    stream = Streaming.new(data)
    expect(stream).to be_a Streaming
    expect(stream.provider).to eq(:disney)
    expect(stream.link).to eq("https://www.disneyplus.com/movies/-/3qBd6ESjzQOm")
  end
end
