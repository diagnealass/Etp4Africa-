require_relative '../lib/crypto_scrapper'

describe "La méthode crypto_scrapper" do
  let(:result) { crypto_scrapper }

  it "doit retourner un Array (tableau)" do
    expect(result).to be_an(Array)
  end

  it "doit contenir des Hashs" do
    expect(result.all? { |item| item.is_a?(Hash) }).to be true
  end

  it "doit extraire au moins 20 cryptomonnaies" do
    expect(result.length).to be >= 20
  end

  it "doit inclure BTC avec un prix valide" do
    btc_data = result.find { |h| h.key?("BTC") }
    expect(btc_data).not_to be_nil
    expect(btc_data["BTC"]).to be_a(Float)
    expect(btc_data["BTC"]).to be > 0
  end

  it "doit inclure ETH avec un prix valide" do
    eth_data = result.find { |h| h.key?("ETH") }
    expect(eth_data).not_to be_nil
    expect(eth_data["ETH"]).to be > 0
  end
end