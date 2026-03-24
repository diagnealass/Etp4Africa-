class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize(player1_name, player2_name)
    # On crée deux joueurs
    p1 = Player.new(player1_name, "X")
    p2 = Player.new(player2_name, "O")
    @players = [p1, p2]
    
    # On initialise le plateau et le statut
    @board = Board.new
    @status = "on going"
    @current_player = @players[0] # Le joueur 1 commence
  end

  def turn
    # 1. On affiche le plateau (on appellera la classe Show plus tard)
    # 2. On demande au joueur ce qu'il veut faire
    puts "C'est au tour de #{@current_player.name} (#{@current_player.symbol})"
    print "Quelle case choisis-tu (ex: A1, B2) ? > "
    choice = gets.chomp.upcase

    # 3. On essaie de jouer le coup sur le Board
    until @board.play_touch(choice, @current_player.symbol)
      puts "Oups ! Case invalide ou déjà prise. Réessaie."
      print "> "
      choice = gets.chomp.upcase
    end

    # 4. On vérifie si le joueur a gagné
    if @board.victory?
      @status = "winner"
    elsif @board.cases.values.none? { |c| c.value == " " }
      @status = "draw" # Match nul si plus de cases vides
    else
      # 5. On change de joueur pour le prochain tour
      switch_player
    end
  end

  def switch_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end
end