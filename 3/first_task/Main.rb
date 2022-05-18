require_relative 'Word.rb'
str = gets.chomp
word = Word.new()
puts word.check_CS_ending(str)