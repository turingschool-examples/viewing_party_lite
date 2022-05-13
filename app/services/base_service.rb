class BaseService
  private

  def self.conn
    Faraday.new("https://api.themoviedb.org")
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
