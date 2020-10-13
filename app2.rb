require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  #Message d'accueil
  puts ""
  puts ""
  puts "*********************************************"
  puts "*  Bienvenue sur tout le monde veut ma POO  *"
  puts "*      Seul le plus fort survivra           *"
  puts "*********************************************"
  puts ""
  puts ""
  #Nom du player

  puts "> Comment t'appelles-tu jeune fighter ?"
  user_name = gets.chomp
  user = HumanPlayer.new(user_name)
  #On créer les ennemies
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  enemies = []
  enemies << player1
  enemies << player2

  #Time to fight
  sleep 1

  puts "******* Et c'est parti pour le show *********"

  sleep 1

  while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts "#{user.show_state}"
    puts ""
    puts "--------------------------"
    puts "- And now, on fait kwa ? -"
    puts "--------------------------"
    puts ""
    sleep 1
    puts "a - cherche une meilleure arme"
    puts "s - cherche à te soigner"
    puts ""
    puts "Attaquer un joueur en vue :"
    if player1.life_points <= 0
      puts "#{player1.name} est dead"
    else
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    end

    if player2.life_points <= 0
      puts "#{player2.name} est dead"
      else
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
      end

    user_menu = gets.chomp

    case user_menu
    when "a"
      user.search_weapon
      puts "--------------"
      gets.chomp
    when "s"
      user.search_health_pack
      puts "--------------"
      gets.chomp

    when "0"
      user.attacks(player1)
      puts "--------------"
      gets.chomp

    when "1"
      user.attacks(player2)
      puts "--------------"
      gets.chomp

    end

    break if user.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)

    puts ""
    puts "¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*"
    puts "¤ Boom ¤*¤ Paf ¤*¤ You're under attack ! ¤*¤ Aie ¤*¤ Outch putaing ¤"
    puts "¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*¤¤*"
    puts ""
    gets.chomp
    enemies.each do |bad_guy|
      if bad_guy.life_points > 0
      bad_guy.attacks(user)
      puts "------------"
      end
    end


  end

  puts "Et hop, c'est fini !"
  if user.life_points > 0
    puts "You're the winner ! Bravo <3"
  else
    puts "C'est la piquette Jack ! T'es mauvais Jack !"
  end




# binding.pry