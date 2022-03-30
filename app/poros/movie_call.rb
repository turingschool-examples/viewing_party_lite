class MovieCall
  attr_reader :api_id,
             :title,
             :summary,
             :runtime,
             :vote_average,
             :genres,
             :hours,
             :minutes,
             :poster

 def initialize(data)
   @api_id = data[:id]
   @title = data[:title]
   @summary = data[:overview]
   @hours = (data[:runtime] / 60) unless data[:runtime].nil?
   @minutes = (data[:runtime] % 60) unless data[:runtime].nil?
   @runtime = data[:runtime]
   @vote_average = data[:vote_average]
   @genres = data[:genres]
   @poster = data[:poster_path]
 end

 def genre_list
  list = ''
  @genres.each_with_index do |hash, idx|
    list << hash[:name]
    idx == (@genres.length - 1) ? next : list << ', '
  end
  list
 end

 def get_poster
   "https://image.tmdb.org/t/p/w200#{@poster}"
 end
end
