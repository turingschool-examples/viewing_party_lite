class MovieService
  def self.popular_movies
    conn = Faraday.new(url: "https://api.themoviedb.org/3")
    
    response = conn.get("/movie/popular?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")

    data = JSON.parse(response.body, symbolize_names: true)
    #require "pry"; binding.pry




  end

end


#   def search
#     conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
#       faraday.headers["X-API-KEY"] = ENV['govt_api_key']
#     end
#     response = conn.get("/congress/v1/116/senate/members.json")
#
#     data = JSON.parse(response.body, symbolize_names: true)
#
#     members = data[:results][0][:members]
#
#     found_members = members.find_all {|m| m[:last_name] == params[:search]}
#     @member = found_members.first
#     render "welcome/index"
#   end
# end
