# class MovieService

#   def get_url(url)
#     conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
#       faraday.headers["x-api-key"] = ENV['movie_api_key']
#       # faraday.params['q'] = params[:search]
#     end

#     response = conn.get(url)

#     data = JSON.parse(response.body, symbolize_names: true)
#   end

#   def top_rated
#     get_url('movie/top_rated')
#   end
# end