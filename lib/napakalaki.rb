# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
include Singleton

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
    if(players.at(0) == @current_player)
      
    end
  end
  
  def next_turn_allowed()
    
  end
  
  def set_enemies()
    
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
    
  end
  
  def get_current_monster()
    
  end
  
  def next_turn()
    
  end
  
  def end_of_game(result)
    
  end
  
end
