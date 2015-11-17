# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
include Singleton

module Napakalaki

class Napakalaki
  attr_reader :current_monster,:current_player,:players
  
  
  private
  def init_players(names)
    
    #Creamos array de jugadores
    @players = Array.new
    
    #Vamos añadiendo los jugadores
    names.each { |n|
    
      @players.push(Player.new(n))
      
    }
  end
  
  def next_player()
    random = Random.new
    if(@players.at(0) == @current_player)
      @players.at(random.rand(@players.length))
    else
      index = @players.index(@current_player)
    
      if(index == @players.length-1)
        @players.at(0)
      else
        @players.at(index)
      end
    end
  end
  
  def next_turn_is_allowed()
    @current_player.valid_state()
  end
  
  def set_enemies()
    random = Random.new
    
    i = 0
    
    while(i < @players.length)
      index = random.rand(@players.length)
      if(i != index)
        @players.at(i).set_enemy(@players.at(index))
        i = i+1
      end
    end
    
  end
  
  public
  def develop_combat()
    
  end
  
  def discard_visible_treasures(treasures)
    
  end
  
  def discard_hidden_treasures(treasures)
    
  end
  
  def make_treasures_visible(treasures)
    
  end
  
  def init_game(players)
    
  end
  
  def get_current_player()
    @current_player
  end
  
  def get_current_monster()
    @current_monster
  end
  
  def next_turn()
    
  end
  
  def end_of_game(result)
    result == CombatResult::WINGNAME
  end
  
end

end
