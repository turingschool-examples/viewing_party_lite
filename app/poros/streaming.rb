class Streaming 
    attr_reader :provider, :link
    def initialize(data)
        @provider = data.first
        @link = data.second[:us][:link]
    end
end