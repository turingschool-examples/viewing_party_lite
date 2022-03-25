require './app/poros/streaming'

class StreamingFacade
attr_reader :links
  def self.streaming_links(imdb_id)
    @links = []
    StreamingService.link(imdb_id)[:streamingInfo].each do |data|
      @links << Streaming.new(data)
    end
    @links
  end
end
