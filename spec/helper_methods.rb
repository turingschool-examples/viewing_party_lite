def load_test_data
  @user1 = User.create!({name: "Adam Anderson", email: "AA@gmail.com"})
  @user2 = User.create!({name: "Bob Berse", email: "BB@gmail.com"})
  @user3 = User.create!({name: "Chuck Chiperson", email: "CC@gmail.com"})
  @user4 = User.create!({name: "Dylan Dillerson", email: "DD@gmail.com"})
 
end

def top_rated_movies_stub
   stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']}).
         to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'), headers: {})
end

def movie_search_stub(keyword)
  stub_request(:get, "https://api.themoviedb.org/3/search/movie")
      .with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }, query: {"api_key"  => ENV['tmdb_api_key'],
          "query" => keyword, 
          "include_adult" => false})
      .to_return(status: 200, body: File.read('spec/fixtures/movie_search.json'), headers: {})
end

def movie_by_id_stub(movie_id)
  stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.4'
        }, query: {"api_key"  => ENV['tmdb_api_key']
          }).

      to_return(status: 200, body: File.read('spec/fixtures/movie_by_id.json'), headers: {})
end

def movie_cast_stub(movie_id)
  stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/credits").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']})
           .to_return(status: 200, body: File.read('spec/fixtures/movie_credits.json'), headers: {})
end

def movie_reviews_stub(movie_id)
  stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/reviews").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }, query: {"api_key"  => ENV['tmdb_api_key']})
           .to_return(status: 200, body: File.read('spec/fixtures/movie_reviews.json'), headers: {})
end