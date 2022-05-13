class Image
  attr_reader :id, :file_path
  def initialize(data)
    @id = data[:id]
    @file_path = data[:posters].first[:file_path]
  end
end
