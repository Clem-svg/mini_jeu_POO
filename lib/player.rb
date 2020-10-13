class Player
  attr_accessor :name, :life_points
  @@enemies = []

  def initialize(name)
    @name = name
    @life_points = 10
    @@enemies << self
  end


  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_points)

      @life_points -= damage_points

    if @life_points <= 0
      puts  "#{@name} est mooooooorrruuu !"
    end
  end

  def attacks(attacked_player)

    puts "#{@name} attaque #{attacked_player.name}"
    damage_points = compute_damage
    puts "#{@name} a infligé #{damage_points} points de dégats à #{attacked_player.name} ! " #On fait un petit état des lieux de la situation ! combien de points de vie fallait cette attaque
    # si on voulait savoir dans la même méthode combien de points il reste au joueur attaqué : Il ne lui reste que #{attacked_player.life_points = attacked_player.life_points - damage_points} points de vie à #{attacked_player.name}
    attacked_player.gets_damage(damage_points)

  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon

     if  @weapon_level*rand(1..6) > @weapon_level
      puts "Youhou, on a une nouvelle arme beaucoup plus badass ! Allez, tu l'embarques, zouh"
      @weapon_level = @weapon_level*rand(1..6)
     else puts "Bon elle est un peu naze cette arme, on la laisse et on se tire"
     end

  end

  def search_health_pack

    random = rand(1..6)

    if random == 1
      puts "Déso, il n'y a rien à voir ici, circule"
    elsif random == 6
      puts "Wouhou, tu as trouvé 80pts de vie ! Bien joué ! Maintenant on les chope et on se tire !"
      if @life_points + 50 >= 100
        @life_points = 100
      else @life_points += 50
      end
    else
      puts "Mazel Tov, tu as trouvé 50pts de vie qui chillaient dans la nature ! On les chope et on se tire ! "
      if @life_points + 80 >= 100
        @life_points = 100
      else @life_points += 80
      end

    end

  end


end