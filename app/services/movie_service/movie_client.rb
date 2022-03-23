module MovieService
  class MovieClient
    API = { top_rated: { url: '/discover/movie' } }

    attr_reader :http_client, :api_type

    def initialize(api_type, http_client: Faraday)
      @http_client = http_client
      @api_type = api_type
    end

    def root_url
      'https://api.themoviedb.org/3'
    end

    def self.call(api_type)
      new(api_type).call
    end

    def top_rated_parameters
      { language: 'en - US',
        sort_by: 'vote_average.desc',
        include_adult: false,
        include_video: false,
        page: 1,
        with_watch_monetization_types: 'flatrate' }
    end

    def url
      root_url + API[api_type][:url]
    end

    def call
      Faraday.get(url, send("#{api_type}_parameters"))
      {
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": nil,
            "genre_ids": [
              28
            ],
            "id": 155,
            "original_language": 'en',
            "original_title": 'The Dark Knight',
            "overview": 'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.',
            "release_date": '2008-07-18',
            "poster_path": nil,
            "popularity": 0.293783,
            "title": 'The Dark Knight',
            "video": false,
            "vote_average": 7.9,
            "vote_count": 5504,
            "rating": 9
          }
        ],
        "total_pages": 31,
        "total_results": 605
      }
    end
  end
end
