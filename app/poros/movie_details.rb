class MovieDetails 
  attr_reader :details 
  
  def initialize(api)
    @details = api[:]
  end
end