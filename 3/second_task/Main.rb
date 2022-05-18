require_relative 'PokemonHash'

puts "Input count how much pokemons do you want to add"
count = gets.chomp.to_i
ph = PokemonHash.new()
count.times do
  puts "Type name of pokemon"
  name = gets.chomp
  puts "Type color of pokemon"
  color = gets.chomp
  pokemon = Pokemon.new(name,color)
  ph.add(pokemon)
  puts "pokemon added\n\n"
end
ph.print
