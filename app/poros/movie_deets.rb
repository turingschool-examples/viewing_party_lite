class MovieDeets
  def initialize(details, credits, reviews)
    @title = details[:title]
    @vote_agerage = details[:vote_average]
    @runtime = details[:runtime]
    @summary = details[:overview]
    @genres = get_genres(details)
    @cast = get_cast(credits)
    @review_count = reviews[:total_results]
    @reviewers = get_reviewers(reviews) # author, author_details[:username], rating
  end

  def get_genres(details)
    details[:genres].map do |hash|
      hash[:name]
    end
  end

  def get_cast(credits)
    credits[:cast][0..9].map do |hash|
      { hash[:name] => hash[:character] }
    end
  end

  def get_reviewers(reviews)
    reviews[:results].map do |result|
      { :name => result[:author],
        :username => result[:author_details][:username],
        :rating => result[:author_details][:rating]}
    end
  end
end
