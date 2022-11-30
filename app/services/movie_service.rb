class MovieService

  def conn
    Faraday.new(:url => "https://api.themoviedb.org/3/")
    end
  end

  def movie_by_id(id)

  end

end
