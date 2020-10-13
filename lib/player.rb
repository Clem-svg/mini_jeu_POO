class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
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