# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'
require_relative 'combat_result.rb'
require_relative 'dice.rb'

module Napakalaki
  
class Player
  @@MAX_LEVEL = 10
  
  attr_reader :name,:level,:dead,:can_i_steal,:visible_treasures,:hidden_treasures
  
  def initialize(name)
    @name = name
    @level = 1
    @dead = true
    @can_i_steal = true
    @visible_treasures = Array.new
    @hidden_treasures = Array.new
  end
  
  def get_name()
    @name
  end
  
  def get_visible_treasures()
    @visible_treasures
  end
  
  def get_hidden_treasures()
    @hidden_treasures
  end
  
  def can_i_steal
    @can_i_steal
  end
  
  def combat(m)
    my_level = get_combat_level()
    monster_level = m.combat_level
    
    if(my_level > monster_level)
      apply_prize(m)
      if(@level >= @@MAX_LEVEL)
        combat_result = CombatResult::WINGNAME
      else
        combat_result = CombatResult::WIN
      end
    else
      apply_bad_consequence(m)
      combat_result = CombatResult::LOSE
    end
    combat_result
  end
  
  def make_treasures_visible(t)
    can_i = can_make_treasure_visible(t)
    if (can_i)
      @visible_treasures << t
      @hidden_treasures.delete(t)
    end
  end
  
  def is_dead()
    @dead
  end
  
  def discard_visible_treasure(t)
    @visible_treasures.delete(t)
    if(!@pending_bad_consequence.nil? && !@pending_bad_consequence.empty?)
      @pending_bad_consequence.substract_visible_treasures(t)
    end
    dielf_no_treasures()
  end
  
  def discard_hidden_treasure(t)
     @hidden_treasures.delete(t)
    if(!@pending_bad_consequence.nil? && !@pending_bad_consequence.empty?)
      @pending_bad_consequence.substract_hidden_treasure(t)
    end
    dielf_no_treasures()
  end
  
  def valid_state()
    b = false
    if @pending_bad_consequence.nil? || (@pending_bad_consequence.is_empty? && hidden_treasures.length <= 4)
        b = true
    end
    b
  end
  
  #Cuando un jugador está en su primer turno o se ha quedado sin tesoros, hay que
  #proporcionarle nuevos tesoros para que pueda seguir jugando
  
  def init_treasures()
    dealer = CardDealer.instance
    dice = Dice.instance
    bring_to_life()
    treasure = dealer.next_treasure()
    @hidden_treasures << treasure
    number = dice.next_number()
    
    if(number > 1)
      treasure = dealer.next_treasure()
      @hidden_treasures << treasure
    end
    
    if(number == 6)
      treasure = dealer.next_treasure()
      @hidden_treasures << treasure
    end
    
  end

=begin
      Cuando el jugador decide robar un tesoro a su enemigo, este método comprueba que
      puede hacerlo (sólo se puede robar un tesoro durante la partida) y que su enemigo tiene
      tesoros ocultos para ser robados (canYouGiveMeATreasure())
=end  
  
  def steal_treasure()
    can_i = can_i_steal()
    if(can_i)
      can_you = @enemy.can_you_give_me_a_treasure()
      if(can_you)
        treasure = @enemy.give_me_a_tresure()
        @hidden_treasures << treasure
        have_stolen()
      end
    end
    treasure
  end
  
  def set_enemy(enmy)
    @enemy = enmy
  end
  
  def discard_all_treasures()
    vt = @visible_treasures
    ht = @hidden_treasures
    
    lengthvt = vt.length
    lengthht = ht.length
    
    for i in 0..lengthvt
      discard_visible_treasure(vt.at(0))
    end
    
    for i in 0..lengthht
      discard_hidden_treasure(ht.at(0))
    end
  end
  
  def to_s
    "#{@name}"
  end
  
  private
  def bring_to_life()
    @dead = false
  end

  def get_combat_level()
    comb_lev = 0
    @visible_treasures.each { |iter|  
      comb_lev = comb_lev + iter.get_bonus()
    }
    comb_lev = comb_lev + @level
    if comb_lev > @@MAX_LEVEL
      comb_lev = @@MAX_LEVEL
    end
    return comb_lev
  end

  def increment_levels(l)
    if @level+l < @@MAX_LEVEL
      @level = @level+l
    else
      @level = @@MAX_LEVEL
    end
  end
  
  def decrement_levels(l)
    if @level-l > 1
      @level = @level -l
    else
      @level = 1
    end
  end
  
  def set_pending_bad_consequence(b)
    @pending_bad_consequence = b
  end
  
  def apply_prize(m)
    n_levels = m.get_levels_gained()
    increment_levels(n_levels)
    n_treasures = m.get_treasures_gained()
    
    if(n_treasures > 0)
      dealer = CardDealer.instance
      for i in 0..n_treasures 
        treasure = dealer.next_treasure()
        @hidden_treasures << treasure
      end
    end
  end
  
  #Cuando el jugador ha perdido el combate, 
  #hay que considerar el mal rollo que le impone el
  #monstruo con el que combatió
  
  def apply_bad_consequence(m)
    bad_consequence = m.get_BC()
    n_levels = bad_consequence.get_levels()
    decrement_levels(n_levels)
    pending_bad = bad_consequence.adjust_to_fit_treasure_lists(@visible_treasures,@hidden_treasures)
    set_pending_bad_consequence(pending_bad)
  end
  
  def can_make_treasure_visible(t)
    if(t.get_type() == TreasureKind::ONEHAND)
      how_many_visible_treasures(t.get_type())!=2 && how_many_visible_treasures(TreasureKind::BOTHHANDS) == 0
    else
      if(t.get_type() == TreasureKind::BOTHHANDS)
          how_many_visible_treasures(TreasureKind::ONEHAND) == 0 && how_many_visible_treasures(TreasureKind::BOTHHANDS) == 0
      else
          how_many_visible_treasures(t.get_type()) == 0
      end
    end
  end
  
  def how_many_visible_treasures(t_kind)
    contador = 0
    @visible_treasures.each { |iter|
      if iter == t_kind
        contador = contador + 1
      end
    }
    contador
  end
  
  def dielf_no_treasures()
    if @visible_treasures.empty? && @hidden_treasures.empty?
      @dead = true 
    end
  end
  
  def give_me_a_treasure()
   random = Random.new
   x = random.rand(@hidden_treasures.length)
   t = @hidden_treasures.x
   @hidden_treasures.delete(x)
   t
  end
  
  def can_you_give_me_a_treasure()
    @hidden_treasures.empty? == false
  end
  
  def have_stolen()
    @can_i_steal = false
  end
  
 end
 
end
