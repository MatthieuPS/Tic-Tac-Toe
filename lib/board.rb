class Board
  attr_accessor :boardcases
  def initialize
    
    @boardcases = []
    for i in (1..9)   
      @boardcases << BoardCase.new(i.to_s)
    end
    print_board
  end

  def print_board  
    barre = '|'
    x = ' ' * 3
    y = ' ' * 14 + barre + ' ' * 7 + barre
    z = ' ' * 6 + '_' * 26

    puts " \n\n "
    puts y
    puts ' ' * 10 + @boardcases[0].value + x + barre + x + @boardcases[1].value + x + barre + x + @boardcases[2].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcases[3].value + x + barre + x + @boardcases[4].value + x + barre + x + @boardcases[5].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcases[6].value + x + barre + x + @boardcases[7].value + x + barre + x + @boardcases[8].value
    puts y
    puts
    puts
  end


  def play(choice, result)
    @boardcases[choice - 1].value = result
  end

  def already_played?(choice)
    if @boardcases[choice - 1].value == 'X' || @boardcases[choice - 1].value == 'O'
      true
    else
      false
    end
  end

  def victory?
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    victory = 0
    win_combos.each do |combo|
      if @boardcases[combo[0]].value == 'X' && @boardcases[combo[1]].value == 'X' && @boardcases[combo[2]].value == 'X'
        victory = 1
      elsif @boardcases[combo[0]].value == 'O' && @boardcases[combo[1]].value == 'O' && @boardcases[combo[2]].value == 'O'
        victory = 2
      end
    end
    victory
  end
end