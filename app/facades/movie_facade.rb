class MovieFacade 

 def self.get_movies(title)
    # title = params["Search by Movie Title"]
    conn = Faraday.new(url: "https://api.themoviedb.org")    

    response = conn.get("/3/search/movie?api_key=#{ENV["movies_api_key"]}&query=#{title}")

      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end 
  end

end

  # json = CongressService.members_of_house(state)
  # @members = json[:results].map do |member_data|
  #   Member.new(member_data)
