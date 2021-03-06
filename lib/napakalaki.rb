# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative 'player.rb'
require_relative 'card_dealer.rb'
require_relative 'combat_result.rb'
require_relative 'monster.rb'

module Napakalaki
  class Napakalaki
    include Singleton
  
  attr_reader :current_monster,:current_player,:players
  
  
  private
  #INICIAR JUGADORES
  def init_players(names)
    
    #Creamos array de jugadores
    @players = Array.new
    
    #Vamos añadiendo los jugadores
    names.each { |i| 
      p = Player.new(i)
      
      @players << p
    }
    next_player()
    
  end
  
  #PRIVATE
  #Decide QUÉ JUGADOR es el SIGUIENTE en jugar.
  def next_player()
    random = Random.new
    if(@current_player.nil?)
      @current_player = @players.at(random.rand(@players.length))
      return @current_player
    else
      index = @players.index(@current_player)
    
      if(index == (@players.length-1))
        @current_player = @players.at(0)
      else
        @current_player = @players.at(index+1)
      end
    end
    
    return @current_player
  end
  
  #PRIVATE
  #SIGUIENTE TURNO PERMITIDO
  def next_turn_is_allowed()
    if(@current_player.nil?) #current_player == null
      return true
    end
    return @current_player.valid_state()
  end
  
  #PRIVATE
  #MÉTODO PARA ASIGNAR ENEMIGOS DE MANERA ALEATORIA
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

  #El jugador actual entra en combate con el monstruo que le ha tocado
  def develop_combat()
    dealer = CardDealer.instance
    
    result = @current_player.combat(@current_monster)
    dealer.give_monster_back(@current_monster)
    
    return result
  end
=begin
    PUBLIC
    Operación encargada de eliminar los tesoros visibles indicados de la lista de tesoros   visibles del jugador. Al eliminar esos tesoros, si el jugador tiene un mal rollo pendiente, se
    indica a éste dicho descarte para su posible actualización. Finalmente, se invoca a
    dieIfNoTreasure() para comprobar si se ha quedado sin tesoros y en ese caso pasar a
    estado de muerto. Los tesoros descartados se devuelven al CardDealer.
    treasures -> Array de Treasure
=end
  
  def discard_visible_treasures(treasures)
    dealer = CardDealer.instance
    
    treasures.each { |t|  
      @current_player.discard_visible_treasure(t)
      dealer.give_treasure_back(t) 
    }
  end
  
  #PUBLIC
  #Similar a lo anterior 
  def discard_hidden_treasures(treasures)
    dealer = CardDealer.instance
    
    treasures.each { |t|  
      @current_player.discard_hidden_treasure(t)
      dealer.give_treasure_back(t) 
    }
  end
  
  #PUBLIC
=begin
  Operación en la que se pide al jugador actual que pase tesoros ocultos a visibles, siempre
  que pueda hacerlo según las reglas del juego.
  NO CONFUNDIR CON make_treasure_visible
  treasures -> Array de Treasure
=end
  
  def make_treasures_visible(treasures)
    treasures.each { |treasure|  
      @current_player.make_treasure_visible(treasure)
    }
  end
  
  #PUBLIC
=begin
     Se encarga de solicitar a CardDealer la inicialización de los mazos de cartas de Tesoros
     y de Monstruos, de inicializar los jugadores proporcionándoles un nombre, asignarle a cada
     jugador su enemigo y de iniciar el juego con la llamada a nextTurn() para pasar al
     siguiente turno (que en este caso será el primero)
=end
  
  #PUBLIC
  def init_game(players)
    dealer = CardDealer.instance
    
    init_players(players)
    
    set_enemies()
    
    dealer.init_cards()
    
    next_turn()
  end
  
  #PUBLIC
  def get_current_player()
    @current_player
  end
  
  #PUBLIC
  def get_current_monster()
    @current_monster
  end
  
  #PUBLIC
  #Verifica si el jugador activo 
  #cumple con las reglas del juego para terminar su turno
  def next_turn()
    
    state_ok = next_turn_is_allowed()
    dealer = CardDealer.instance
    
    if(state_ok)
      @current_monster = dealer.next_monster()
      @current_player = next_player()
      dead = @current_player.is_dead()
      if(dead)
        @current_player.init_treasures()
      end
    end
    
    return state_ok
  end
  
  #PUBLIC
  def end_of_game(result)
    return result == CombatResult::WINGNAME
  end
  
end

end
