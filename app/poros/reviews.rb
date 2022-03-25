class Reviews
  attr_reader :author, :information
  def initialize(data)
    @author = data[:author]
    @information = data[:information]
  end
end