require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




  player1 = Player.new("Josiane")
  player2 = Player.new("José")

  puts "Good afternoon Ladies and Gentlemen"
  puts ""
  puts "And welcome à notre fight du jour !"
  puts ""
  puts "Let's meet the challengers"
  puts "To the right, #{player1.name}..."
  sleep 1
  puts "... to the left, #{player2.name} !"
  sleep 1
  print player1.show_state
  print player2.show_state
  puts""
  puts "===== QUE LE COMBAT COMMEEEENNNCE ====="
  sleep 1



  while player1.life_points >= 0 && player2.life_points >= 0  #tant que nos deux joueurs sont vivants, le combat continue !

    puts ""
    puts " * Et c'est tipar pour se taper dessus *"
    puts ""
    player1.attacks(player2)
    break if player2.life_points <= 0 #On break au cas où un des joueurs de ne serait plus vivant avant la fin de la boucle

    puts""
    player2.attacks(player1)
    break if player1.life_points <= 0 #On break au cas où un des joueurs de ne serait plus vivant avant la fin de la boucle

    puts ""


    sleep 1
    puts ""
    puts "* Voilà l'état de nos joueurs *"
    puts ""
    print player1.show_state
    print player2.show_state
    puts ""


  end
    puts ""
    puts "... AND THE WINNER IS ...."
    puts ""
    sleep 1
    if player1.life_points <= 0
      puts "#{player2.name} a gagné !"

    else player2.life_points <= 0
    puts "#{player1.name} a gagné !"


  end



# binding.pry