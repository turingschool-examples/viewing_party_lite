class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  def self.poster(title)
		conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api']
    end
    response = conn.get("/3/search/movie?api_key=17774d224d9d374cf775b5850c113b88&query=#{title}")
    data = JSON.parse(response.body, symbolize_names: true)
		
    data[:results][0][:poster_path] #"/62HCnUTziyWcpDaBO2i1DX17ljH.jpg"
	end
end