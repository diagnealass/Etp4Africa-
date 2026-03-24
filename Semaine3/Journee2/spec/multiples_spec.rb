require_relative '../lib/multiples'

describe "the is_multiple_of_3_or_5? method" do

  it "should return TRUE when an integer is a multiple of 3 or 5" do
    expect(is_multiple_of_3_or_5?(3)).to eq(true)
    expect(is_multiple_of_3_or_5?(5)).to eq(true)
    expect(is_multiple_of_3_or_5?(51)).to eq(true)
    expect(is_multiple_of_3_or_5?(45)).to eq(true)
  end

  it "should return FALSE when an integer is NOT a multiple of 3 or 5" do
    expect(is_multiple_of_3_or_5?(2)).to eq(false)
    expect(is_multiple_of_3_or_5?(7)).to eq(false)
    expect(is_multiple_of_3_or_5?(64)).to eq(false)
  end

end

describe "the sum_of_3_or_5_multiples method" do

  it "should return the correct sum when given a valid natural integer" do
    expect(sum_of_3_or_5_multiples(11)).to eq(33)
    expect(sum_of_3_or_5_multiples(10)).to eq(23)
    expect(sum_of_3_or_5_multiples(0)).to eq(0)
    expect(sum_of_3_or_5_multiples(3)).to eq(0)
    expect(sum_of_3_or_5_multiples(1000)).to eq(233168)
  end

  it "should return an error message when the input is NOT a natural integer" do
    expect(sum_of_3_or_5_multiples(-1)).to eq("Yo ! Je ne prends que les entiers naturels. TG.")
    expect(sum_of_3_or_5_multiples(1.23)).to eq("Yo ! Je ne prends que les entiers naturels. TG.")
    expect(sum_of_3_or_5_multiples("chiffre")).to eq("Yo ! Je ne prends que les entiers naturels. TG.")
  end

end