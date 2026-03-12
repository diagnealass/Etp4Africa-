class Show
  def show_board(board)
    # On récupère les valeurs des cases pour plus de lisibilité
    c = board.cases
    
    # On vide le terminal pour un effet "application"
    system "clear"
    
    puts "      1     2     3"
    puts "   -------------------"
    puts "A  |  #{c["A1"].value}  |  #{c["A2"].value}  |  #{c["A3"].value}  |"
    puts "   -------------------"
    puts "B  |  #{c["B1"].value}  |  #{c["B2"].value}  |  #{c["B3"].value}  |"
    puts "   -------------------"
    puts "C  |  #{c["C1"].value}  |  #{c["C2"].value}  |  #{c["C3"].value}  |"
    puts "   -------------------"
    puts ""
  end
end