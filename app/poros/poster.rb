class Poster
  attr_reader :url
  def initialize(attributes)
    @url = attributes[:posters].first[:file_path]
  end
end