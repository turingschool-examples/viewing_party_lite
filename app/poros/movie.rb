class Movie
  attr_reader :poster, :title
  def initialize(data)
    @poster = data[:poster_path]
    @title = data[:original_title]
  end
end