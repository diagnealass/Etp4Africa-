require_relative '../lib/word_counter'

describe "the word_counter method" do
  let(:dictionary) { ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"] }

  it "should count occurrences of dictionary words in a single word" do
    expect(word_counter("below", dictionary)).to eq({"below"=>1, "low"=>1})
  end

  it "should count occurrences in a full sentence regardless of case" do
    expect(word_counter("Howdy partner, sit down! How's it going?", dictionary)).to eq({
      "down"=>1, "how"=>2, "howdy"=>1, "go"=>1, "going"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1
    })
  end
end