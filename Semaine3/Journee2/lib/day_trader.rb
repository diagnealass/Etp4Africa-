def day_trader(prices)
  best_days = []
  max_profit = 0

  # On parcourt chaque jour d'achat possible
  prices.each_with_index do |buy_price, buy_day|
    
    # On compare avec chaque jour de revente situé APRÈS le jour d'achat
    ((buy_day + 1)...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      current_profit = sell_price - buy_price

      # Si on trouve un meilleur profit que le précédent, on met à jour
      # On change ">" par ">=" pour capturer l'opportunité la plus récente en cas d'égalité
      if current_profit >= max_profit && current_profit > 0
        max_profit = current_profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  # Retourne nil si aucun profit n'est possible (max_profit reste à 0)
  best_days.empty? ? nil : best_days
end