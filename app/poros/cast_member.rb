class CastMember
    attr_reader :name, :character, :order
    def initialize(data)
        @name = data[:name]
        @character = data[:character]
        @order = data[:order]
    end
end