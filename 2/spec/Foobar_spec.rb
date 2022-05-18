require_relative '../Foobar.rb'

describe "Foobar" do
  it "x_eqvals_20_y_eqvals_10" do
    foob = Foobar.new()
    result = foob.isEqvalsTwenty(20,10)
    expect(result).to eq(10)
  end
  it "x_eqvals_19_y_eqvals_20" do
    foob = Foobar.new()
    result = foob.isEqvalsTwenty(19,20)
    expect(result).to eq(19)
    end
  it "x_eqvals_19_y_eqvals_18" do
    foob = Foobar.new()
    result = foob.isEqvalsTwenty(19,18)
    expect(result).to eq(37)
  end
end


