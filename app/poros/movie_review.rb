class MovieReview
  attr_reader :name,
              :user_name,
              :content,
              :rating

  def initialize(data)
    @name = data[:author]
    @user_name = data[:author_details][:username]
    @content = data[:content]
    @rating = data[:author_details][:rating]
    @poster = data[:poster_path]
  end 
end