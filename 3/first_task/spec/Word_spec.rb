require_relative '../Word.rb'

describe "Word" do
  it "str_ending_eqval_CS" do
    word = Word.new()
    result = word.check_CS_ending("HOUSECS")
    expect(result).to eq(128)
    end
  it "str_ending_eqval_cs" do
    word = Word.new()
    result = word.check_CS_ending("carcs")
    expect(result).to eq(32)
    end
  it "str_ending_not_eqval_cs" do
    word = Word.new()
    result = word.check_CS_ending("cat")
    expect(result).to eq("tac")
    end
    it "str_is_empty" do
    word = Word.new()
    result = word.check_CS_ending("")
    expect(result).to eq("String is empty")
  end


end

