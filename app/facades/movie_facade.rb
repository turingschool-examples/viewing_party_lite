class MovieFacade
  def self.popular_movies
    response1 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    pop_movies1 = JSON.parse(response1.body, symbolize_names: true)

    # pop_movies1 = MovieService.call_api("/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    # pop_movies2 = MovieService.call_api("/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")

    # 40.times do
    #   pop_movies.map do |pop_movie|
    #     PopMovie.new(pop_movie)
    #   end
    # end
#make sure we get what we think we are getting and mind the pages
    #
    movies1 = pop_movies1[:results].map do |pop_movie|
      PopMovie.new(pop_movie)
    end

    movies2 = pop_movies2[:results].map do |pop_movie|
      PopMovie.new(pop_movie)
    end

    movies1 + movies2

  end

  # def add_plus_sign(string)
  #   split_str = str.split(" ")
  #   str_with_sign = split_str[0]
  #   count = 1
  #
  #   while count < split_str.length
  #     str_with_sign = str_with_sign + "+" + split_str[count]
  #     count += 1
  #   end
  #
  #   str_with_sign
  # end

  def self.movie_search(keyword)

    split_str = keyword.split(" ")
    str_with_sign = split_str[0]
    count = 1

    while count < split_str.length
      str_with_sign = str_with_sign + "+" + split_str[count]
      count += 1
    end

    str_with_sign

    results = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=05946dc2dc50df636962153f45926dbe&query=" + str_with_sign + "&page=1")
    movies = JSON.parse(results.body, symbolize_names: true)
    # https://api.themoviedb.org/3/search/movie?api_key=05946dc2dc50df636962153f45926dbe&query=birthday+gift
    movies1 = movies[:results].map do |movie|
      PopMovie.new(movie)
    end

    results = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=05946dc2dc50df636962153f45926dbe&query=" + str_with_sign + "&page=2")
    movies = JSON.parse(results.body, symbolize_names: true)
    # https://api.themoviedb.org/3/search/movie?api_key=05946dc2dc50df636962153f45926dbe&query=birthday+gift
    movies2 = movies[:results].map do |movie|
      PopMovie.new(movie)
    end

    movies1 + movies2
  end


end
# hide the key
#https://developers.themoviedb.org/3/movies/get-top-rated-movies
# https://api.themoviedb.org/3/movie/top_rated
