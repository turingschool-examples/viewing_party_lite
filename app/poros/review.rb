class Review
  attr_reader :id,
              :page,
              :results
  def initialize(response)
    @id = response[:id]
    @page = response[:page]
    @results = response[:results]
  end
end