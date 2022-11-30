require 'pry'
require 'faraday'

class MoviesService
  def top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org', params: {api_key: ENV['movie_api_key']}) 
  
    response = conn.get('/3/movie/100')

    json_body = response.body
    parsed_response = JSON.parse(json_body, symbolize_names: true)
  end
end

# /top_rated
# data[:results] array with each element being a hash
    #hash keys:
    #:adult
    #:genre_ids
    #:id
    #original_language
    #original_title
    #overview
    #popularity
    #poster_path (append value to this: https://image.tmdb.org/t/p/original) (/3bhkrj58Vtu7enYsRolD1fZdja1.jpg)
    #release_date
    #title
    #video
    #vote_average
    #vote_count

    # https://api.themoviedb.org/3/movie/241