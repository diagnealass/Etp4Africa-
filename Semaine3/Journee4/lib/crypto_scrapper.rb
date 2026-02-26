require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  url = "https://coinmarketcap.com/all/views/all/"
  
  begin
    html = URI.open(url, "User-Agent" => "Mozilla/5.0")
    page = Nokogiri::HTML(html)
  rescue StandardError => e
    return "Erreur : #{e.message}"
  end

  # Extraction des symboles (ex: BTC)
  symbols = page.css('td.cmc-table__cell--sort-by__symbol').map(&:text)

  # Extraction et nettoyage des prix (suppression $ et virgules)
  prices = page.css('td.cmc-table__cell--sort-by__price').map do |p|
    p.text.delete("$").delete(",").to_f
  end

  # Fusion en un tableau de hashs [{"BTC"=>60000.0}, {"ETH"=>3000.0}]
  crypto_list = symbols.zip(prices).map { |s, p| { s => p } }

  return crypto_list
end

# Affichage du résultat
# puts crypto_scrapper