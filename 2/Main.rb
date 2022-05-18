require_relative 'Greeting'
require_relative 'Foobar'
puts "Set firstname "
firstName = gets.chomp
puts "Set lastname"
lastName = gets.chomp
puts "Set your age"
age = gets.chomp.to_i

greeting = Greeting.new()
greeting.greet(firstName,lastName, age);


foobar = Foobar.new()
foobar.isEqvalsTwenty(10,20)




