require_relative 'Pokemon'
class PokemonHash
  attr_accessor :pokHash

  def initialize
    @pokHash = {}
  end
  def add (pokemon)
    if pokemon == nil
      return "pokemon is nil"
    end
    pokemons = { pokemon.name => pokemon.color}
    return @pokHash = @pokHash.merge(pokemons)

  end
  def print
    pokHash.each  do |k,v|
    puts "name: "+k +"  "+ "color: "+v
    end
  end
end
