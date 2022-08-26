class MovieService #setup service then connection setup and call 

  def self.connection(url, param = nil) #feeds into methods below to hit URL + endpoint
    conn = Faraday.new('https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movies_api_key'] #unique api key given by movies DB
      faraday.params['query'] = @keyword #param unless param.nil? #user keyword which came from the param[:search] from our user in the view
      faraday.params['language'] = 'en-US' #english
    end
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true) #response contains our added headers and response meta data/info of the request
  end

  def self.top_rated_movies #
    connection('/3/movie/top_rated') # our end point from movies DB
  end

  def self.movie_searching_service(keyword)
    # binding.pry
    @keyword = keyword 
    connection('/3/search/movie')
  end
  #from movies DB: 'query'is a string which Pass a text query to search. This value should be URI encoded. minLength: 1

end