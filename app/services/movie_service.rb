class MovieService
  def self.get_movie_data(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

<<<<<<< HEAD
  def self.get_top_rated
    response = conn.get('/3/movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movies_search(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}")
    JSON.parse(response.body, symbolize_names: true)
=======
  def self.get_cast_data(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_review_data(movie_id)
    page_count = 1
    responses = 0
    loop do 
      response = conn.get("/3/movie/#{movie_id}/reviews?page=#{page_count}")
      json = JSON.parse(response.body, symbolize_names: true)
      if page_count == 1
        responses = json
      else
        json[:results].each {|result| responses[:results] << result}
      end
      break if page_count >= json[:total_pages]
      page_count += 1
    end
    responses
>>>>>>> 00374cb3e5da8fdd745d0654e6d2de469ddb7313
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
      f.params['language'] = 'en-US'
    end
  end
end
