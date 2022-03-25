class MovieCast
   attr_reader :name, 
               :character
               
   def initialize(cast_info)
      @name = cast_info[:name]
      @character = cast_info[:character]
   end
end 