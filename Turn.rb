class Turn

  def initialize(active, inactive)
    @activeplayer = active
    @inactiveplayer=  inactive
    @var1 = rand(1..20)
    @var2 = rand(1..20)
    question
  end

  def question
    puts "-----NEW TURN-----"
    print @activeplayer.name, ": What does ", @var1, " + ", @var2, " equal?"
    puts ""
    print "> "
    panswer
  end

  def panswer
    choice = gets.chomp
    correct = @var1 + @var2
    if choice.to_i === correct
      ending(true)
    else
      ending(false)
    end
  end

  def ending(choice)
    if choice == true
      puts "Correct!"
      livesprint
      Turn.new(@inactiveplayer, @activeplayer)
    else
      puts "Incorrect!"
      if @activeplayer.lives > 1
        @activeplayer.lives = @activeplayer.lives-1
        livesprint
        Turn.new(@inactiveplayer, @activeplayer)
      else
        print @inactiveplayer.name, " wins with a score of ", @inactiveplayer.lives, "/3 \n"
        puts "-------- GAME OVER ---------"
        puts "Good bye!"
      end 
      
    end
  end

  def livesprint
    if @activeplayer.name == "Player 1"
      print "P1: ", @activeplayer.lives, "/3 vs P2 ", @inactiveplayer.lives, "/3 \n"
    else
      print "P1: ", @inactiveplayer.lives, "/3 vs P2 ", @activeplayer.lives, "/3 \n"
    end
  end

end