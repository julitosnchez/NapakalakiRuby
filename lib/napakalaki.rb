# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative 'player.rb'

module Napakalaki
  class Napakalaki
    include Singleton
  
  attr_reader :current_monster,:current_player,:players
  
  
  private
  def init_players(names)
    
    #Creamos array de jugadores
    @players = Array.new
    
    #Vamos añadiendo los jugadores
    names.each { |i| 
      p = Player.new(i)
      
      @players << p
      
    }
  end
  
  def next_player()
    random = Random.new
    if(@current_player.nil?)
      @current_player = @players.at(random.rand(@players.length))
      @current_player
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
=begin
    El jugador actual entra en combate con el monstruo que le ha tocado
=end
  def develop_combat()
    result = @current_player.combat(@current_monster)
    dealer = CardDealer.instance
    dealer.give_monster_back(@current_monster)
    result
  end
=begin
    Operación encargada de eliminar los tesoros visibles indicados de la lista de tesoros   visibles del jugador. Al eliminar esos tesoros, si el jugador tiene un mal rollo pendiente, se
    indica a éste dicho descarte para su posible actualización. Finalmente, se invoca a
    dieIfNoTreasure() para comprobar si se ha quedado sin tesoros y en ese caso pasar a
    estado de muerto. Los tesoros descartados se devuelven al CardDealer
=end
  
  def discard_visible_treasures(treasures)
    dealer = CardDealer.instance
    treasures.each { |t|  
      @current_player.discard_visible_treasure(t)
      dealer.give_treasure_back(t) 
    }
  end
  #Similar a lo anterior
  def discard_hidden_treasures(treasures)
    dealer = CardDealer.instance
    treasures.each { |t|  
      @current_player.discard_hidden_treasure(t)
      dealer.give_treasure_back(t) 
    }
  end
  
=begin
  Operación en la que se pide al jugador actual que pase tesoros ocultos a visibles, siempre
  que pueda hacerlo según las reglas del juego
=end
  
  def make_treasures_visible(treasures)
    treasures.each { |treasure|  
      @current_player.make_treasure_visible(treasure)
    }
  end
  
=begin
Se encarga de solicitar a CardDealer la inicialización de los mazos de cartas de Tesoros
     y de Monstruos, de inicializar los jugadores proporcionándoles un nombre, asignarle a cada
     jugador su enemigo y de iniciar el juego con la llamada a nextTurn() para pasar al
     siguiente turno (que en este caso será el primero)
=end
  
  def init_game(players)
    init_players(players)
    set_enemies()
    dealer = CardDealer.instance
    dealer.init_cards()
  end
  
  def get_current_player()
    @current_player
  end
  
  def get_current_monster()
    @current_monster
  end
  
  #Verifica si el jugador activo 
  #cumple con las reglas del juego para terminar su turno
  
  def next_turn()
    state_ok = nex_turn_is_allowed()
    dealer = CardDealer.instance
    
    if(state_ok)
      @current_monster = dealer.next_monster()
      @current_player = next_player()
      dead = @current_player.is_dead()
      if(dead)
        @current_player.init_treasures()
      end
    end
    
    state_ok
  end
  
  def end_of_game(result)
    result == CombatResult::WINGNAME
  end
  
end

end
