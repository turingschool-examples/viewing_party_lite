class BaseService 
    def self.movie_connection
        url = 'https://api.themoviedb.org'
        Faraday.new(url: url)
    end
end