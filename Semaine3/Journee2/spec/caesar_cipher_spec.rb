require_relative '../lib/caesar_cipher'

describe "the caesar_cipher method" do
  it "should cipher a simple word with a key of 5" do
    expect(caesar_cipher("abc", 5)).to eq("fgh")
  end

  it "should respect the case (upcase/downcase)" do
    expect(caesar_cipher("AbC", 5)).to eq("FgH")
  end

  it "should loop from z to a" do
    expect(caesar_cipher("xyz", 3)).to eq("abc")
    expect(caesar_cipher("XYZ", 3)).to eq("ABC")
  end

  it "should not change punctuation or spaces" do
    expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
  end

  it "should handle large keys using modulo" do
    expect(caesar_cipher("abc", 26)).to eq("abc") # Un tour complet
  end
end