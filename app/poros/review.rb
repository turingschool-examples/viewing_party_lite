class Review
  attr_reader :author,
              :summary

  def initialize(data)
    @author  = data[:author]
    @summary = data[:content]
  end
end
