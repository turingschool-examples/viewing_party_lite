class Review 
  attr_reader :author, :name, :username, :avatar_path, :rating

  def initialize(data)
    @author = data[:author]
    @name = data[:author_details][:name]
    @username = data[:author_details][:username]
    @avatar_path = data[:author_details][:avatar_path]
    @rating = data[:author_details][:rating]
  end
end