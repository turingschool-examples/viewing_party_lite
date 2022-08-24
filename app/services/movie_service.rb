class MovieService 
  def self.details 
    get_url('/movie')
  end

  def get_url(url) 
    response = Faraday.get("https://api.themoviedb.org/3#{url}")
  end
end