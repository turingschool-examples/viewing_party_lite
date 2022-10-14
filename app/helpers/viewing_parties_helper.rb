module ViewingPartiesHelper

  def poster_render(uri_path)
    image_tag("https://image.tmdb.org/t/p/w500/#{uri_path}")
  end
end
