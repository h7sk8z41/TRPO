require_relative '../Greeting.rb'

describe "Greeting" do
  it "#greet_when_age_is_higher_18" do
    greeting = Greeting.new()
    result = greeting.greet("Nikita","Baranov", 18)
    expect(result).to eq("Hello Nikita Baranov. Good time to work.")
  end
  it "#gree_when_age_is_under_18" do
    greeting = Greeting.new()
    result = greeting.greet("Timofey", "Ivanov", 15);
    expect(result).to eq("Hello, Timofey Ivanov. You are under 18 but start it's never too early to learn to program.")
  end
end
