class Search 
  attr_reader :search_results
  
  def initialize(api)
    @search_results = api[:results]
  end
end