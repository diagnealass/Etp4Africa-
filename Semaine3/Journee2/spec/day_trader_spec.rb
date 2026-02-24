require_relative '../lib/day_trader'

describe "the day_trader method" do
  it "should return the best days for buying and selling" do
    expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
  end

  it "should return the best days when there are multiple profit opportunities" do
    expect(day_trader([1, 10, 1, 11])).to eq([2, 3]) # Profit de 10 (11-1) au lieu de 9
  end

  it "should return nil or empty if no profit is possible" do
    expect(day_trader([20, 15, 10, 5])).to eq(nil)
  end
end