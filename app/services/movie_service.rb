class MovieService < BaseService
  def self.get_top_rated

    response = conn("http://api.themoviedb.org").get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    get_json(response)
  end

  def self.movie_details(id)
    binding.pry
    response = conn("http://api.themoviedb.org").get("/3/movie/#{id}?api_key=#{ENV['movie_api_key']}&append_to_response=credits,reviews")
    get_json(response)
  end
end


# class GithubService < BaseService
#   # def self.get_repo_data
#   #   response = conn("https://api.github.com").get("/repos/ScottSullivanltd/little-esty-shop")
#   #   get_json(response)
#   # end
# end
