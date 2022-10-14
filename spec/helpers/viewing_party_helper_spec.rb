require 'rails_helper'

RSpec.describe ViewingPartiesHelper do
  describe 'poster_render' do
    it 'takes uri as argument, renders image tag with full url for poster path' do
      uri_path = "pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg"
      uri_path2 = "pB8asdfdfdswefwefDrQ3PmJK.jpg"
      expect(poster_render(uri_path)).to eq(image_tag("https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg"))
      expect(poster_render(uri_path2)).to eq(image_tag("https://image.tmdb.org/t/p/w500/pB8asdfdfdswefwefDrQ3PmJK.jpg"))
    end
  end
end