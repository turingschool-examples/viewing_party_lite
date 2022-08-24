class Movie 
    attr_reader :id, :title, :runtime, :vote_average, :genres, :summary, :cast, :review_count, :reviews

    def initialize(data1, data2, data3)
        @reviews = {}
        @id = data1[:id]
        @title = data1[:title]
        @runtime = data1[:runtime]
        @vote_average = data1[:vote_average]
        @genres = data1[:genres].map {|genre| genre[:name]}
        @summary = data1[:overview]
        @cast = data2[:cast].map {|cast| "#{cast[:name]} as #{cast[:character]}"}
        @review_count = data3[:total_results]
        data3[:results].map {|result| @reviews[result[:author]] = result[:content]} 
    end  

    def first_10_cast
        @cast.first(10)
    end 

end 