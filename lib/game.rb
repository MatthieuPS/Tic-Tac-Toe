class Game
  attr_accessor :players, :board

  def initialize

    puts 'Quel est le nom du premier joueur ?'
    print '> '
    player1_firstname = gets.chomp
    player1 = Player.new(player1_firstname, 'X')
    puts '_' * 37
    puts
    puts 'Quel est le nom du deuxième joueur ?'
    print '> '
    player2_firstname = gets.chomp
    player2 = Player.new(player2_firstname, 'O')

    @players = [player1, player2] 
    @board = Board.new
  end

  def launch_game
    
    9.times do |i|
      if @board.victory? == 0
        turn(i)
      else
        if @board.victory? == 1 
          puts "#{@players[0].firstname} gagne la partie !"
        

        else 
          puts "#{@players[1].firstname} a perdu ! Looser ! "
        end
        exit
      end
    end
    puts "Match nul !!!"
  end

  def turn(i)
    n = i % 2 
    puts "#{@players[n].firstname}, Choisis une case entre 1 et 9 ?"
    choice = gets.chomp.to_i
    while !choice.between?(1, 9) || (@board.already_played?(choice) == true)
      if !choice.between?(1, 9)
        puts "Tu dois saisir un nombre entre 1 et 9 ! #{@players[n].firstname}, sur quelle case souhaites-tu jouer ?"
        choice = gets.chomp.to_i
      elsif @board.already_played?(choice) == true
        puts 'Et non, déjà pris, filou !'
        puts "#{@players[n].firstname}, sur quelle case souhaites-tu jouer entre 1 et 9 ?"
        choice = gets.chomp.to_i
      end
    end
    @board.play(choice, @players[n].type)
    @board.print_board
  end
end