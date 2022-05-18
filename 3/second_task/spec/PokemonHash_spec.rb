require_relative '../PokemonHash.rb'
require_relative '../Pokemon.rb'

describe "PokemonHash" do
  it "add_object" do
    ph = PokemonHash.new()
    result = ph.add(Pokemon.new("Pikachu","Yellow"))
    expect(result).to eq({"Pikachu"=>"Yellow"})
    end
  it "add_empty" do
    ph = PokemonHash.new()
    expect(ph.add(nil)).to eq("pokemon is nil")
    end

  end

