require_relative '../lib/mairie_christmas'

describe "Mairie Christmas program" do
  
  describe "get_townhall_email" do
    it "should return a valid email for Avernes" do
      url = "http://annuaire-des-mairies.com/95/avernes.html"
      expect(get_townhall_email(url)).to eq("mairie.avernes@orange.fr")
    end
  end

  describe "get_townhall_urls" do
    it "should return an array of URLs" do
      expect(get_townhall_urls).to be_an(Array)
      expect(get_townhall_urls.first).to include("http://annuaire-des-mairies.com/95/")
    end
  end

  describe "mairie_christmas" do
    it "should return an array containing hashes" do
      result = mairie_christmas
      expect(result).to be_an(Array)
      expect(result.any? { |h| h.key?("Avernes") }).to be true
    end
  end
end