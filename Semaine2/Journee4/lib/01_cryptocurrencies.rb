
names = ["Bitcoin", "Ethereum", "XRP", "Bitcoin Cash", "EOS", "Litecoin", "Cardano", "Stellar", "IOTA", "Tether", "NEO", "TRON", "Monero", "Dash", "Ethereum Classic", "NEM", "Binance Coin", "VeChain", "OmiseGO", "Qtum", "Zcash", "Ontology", "ICON", "Bytecoin", "Lisk", "Zilliqa", "Bitcoin Gold", "Aeternity", "Decred", "0x", "Steem", "BitShares", "Bytom", "Siacoin", "Augur", "Verge", "Nano", "Maker", "Bitcoin Diamond", "Dogecoin", "DigiByte", "Waves", "Populous", "Golem", "RChain", "Status", "Stratis", "Wanchain", "Basic Attenti...", "IOST"]

prices = ["6558.07", "468.95", "0.487526", "762.84", "8.86", "85.26", "0.151268", "0.206756", "1.18", "0.998033", "39.47", "0.038865", "140.57", "241.10", "16.40", "0.184721", "14.05", "2.64", "7.96", "8.98", "180.36", "5.09", "1.68", "0.003487", "5.63", "0.079253", "29.05", "2.10", "68.39", "0.908975", "1.77", "0.160134", "0.397237", "0.010946", "35.03", "0.025425", "2.61", "551.89", "1.97", "0.002620", "0.028549", "2.99", "8.01", "0.348054", "0.804896", "0.080015", "2.75", "2.50", "0.248590", "0.027269"]

# Création du hash avec zip
crypto_hash = names.zip(prices).to_h { |name, price| [name, price.to_f] }

puts "Le Hash créé permettant de faire lier les noms de crypto à leurs prix Le"
puts crypto_hash.first(3).to_s  # Affiche les 3 premiers pour vérification

# 1. Crypto(s) avec la plus grosse valeur
max_value = crypto_hash.values.max
max_cryptos = crypto_hash.select { |_, v| v == max_value }
puts "\nLe Crypto(s) la plus chère dans le hash cree est"
max_cryptos.each { |name, price| puts "#{name}: #{price}" }

# 2. Crypto(s) avec la plus petite valeur
min_value = crypto_hash.values.min
min_cryptos = crypto_hash.select { |_, v| v == min_value }
puts "\nLe Crypto(s) la moins chère dans le hash cree est "
min_cryptos.each { |name, price| puts "#{name}: #{price}" }

# 3. Nombre de cryptos contenant "coin" (insensible à la casse)
coin_count = crypto_hash.keys.count { |name| name.downcase.include?("coin") }
puts "\nLe Nombre de cryptos contenant 'coin' dans le hash cree est"
puts coin_count

# 4. Devises dont le cours est inférieur à 6000
under_6000 = crypto_hash.select { |_, v| v < 6000 }
puts "\nLa Devises dont le cours est inférieur à 6000 "
under_6000.each { |name, price| puts "#{name}: #{price}" }

# 5. La devise la plus chère parmi celles dont le cours est inférieur à 6000
most_expensive_under_6000 = under_6000.max_by { |_, v| v }
puts "\nLa Devise la plus chère parmi celles < 6000 "
puts "#{most_expensive_under_6000[0]}: #{most_expensive_under_6000[1]}"