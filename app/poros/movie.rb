class Movie
    attr_reader :title, :genres, :summary, :vote_average, :duration, :minutes
    def initialize(data)
        @title = data[:title]
        @genres = data[:genres].map do |array|
            array[:name]
        end
        @summary = data[:overview]
        @vote_average = data[:vote_average]
        @duration = time_format(data[:runtime])
        @minutes = data[:runtime]
    end

    def time_format(minutes)
        hours = minutes / 60 
        min = minutes %60
        return "#{hours} hour(s) and #{min} minute(s)"
    end
end