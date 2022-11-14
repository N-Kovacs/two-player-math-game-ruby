require './Player'

class Turn

  def initialize()
    @player1 = Player.new("Player 1")
    @player2=  Player.new("Player 2")
    @current_player = @player1
    @var1 = rand(1..20)
    @var2 = rand(1..20)
    question
  end

  def question
    @var1 = rand(1..20)
    @var2 = rand(1..20)
    puts "-----NEW TURN-----"
    print @current_player.name, ": What does ", @var1, " + ", @var2, " equal?"
    puts ""
    print "> "
    panswer
  end

  def panswer
    choice = gets.chomp
    correct = @var1 + @var2
    correctanswer = choice.to_i === correct
    ending(correctanswer)
  end

  def ending(choice)
    
    if choice == true
      puts "Correct!"
    else
      puts "Incorrect!"
      @current_player.reducelife
      if @current_player.lives == 0
        endgame 
      end 
    end

    livesprint

    if @current_player.lives > 0
      switch_player
      question
    end    

  end

  def endgame
    switch_player
    print @current_player.name, " wins with a score of ", @current_player.lives, "/3 \n"
    puts "------ GAME OVER -----"
    puts "Good bye!"

    exit(0)
  end

  def livesprint
    print "P1: ", @player1.lives, "/3 vs P2: ", @player2.lives, "/3 \n"
  end

  def switch_player
    if @current_player.name == "Player 1"
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

end