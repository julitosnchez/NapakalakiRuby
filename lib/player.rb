# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  
class Player
  @@MAX_LEVEL = 10
  #¿ESTO SE PUEDE HACER PARA NOTIFICAR QUE EXISTEN PERO NO INICIALIZARLOS?
  @pending_bad_consequence
  @enemy
  
  def initialize(name)
    @name = name
    @level = 1
    @dead = true
    @can_i_steal = true
    @visible_treasures = Array.new
    @hidden_treasures = Array.new
  end
  
  def combat(m)
    
  end
  
  def make_treasure_visible(t)
    
  end
  
  def discard_visible_treasure(t)
    
  end
  
  def valid_state()
    b = false
    if @pending_bad_consequence.is_empty() && hidden_treasures.length <= 4
        b = true
    end
    b
  end
  
  def init_treasures()
    
  end
  
  def steal_treasure()
    
  end
  
  def set_enemy(enmy)
    @enemy = enmy
  end
  
  def discard_all_treasures()
    
  end
  
  private
  def bring_to_life()
    @dead = false
  end
  
  def get_combat_level()
    comb_lev = 0
    @visible_treasure.each { |iter|  
      comb_lev = comb_lev + iter.bonus
    }
    comb_lev = comb_lev + @level
    if comb_lev > @@MAX_LEVEL
      comb_lev = @@MAX_LEVEL
    comb_lev
    end
  end
  
  def increment_levels(l)
    if @level+l < @@MAX_LEVEL
      @level = @level+l
    end
  end
  
  def decrement_levels(l)
    if @level-l >= 1
      @level = @level -l
    end
  end
  
  def set_pending_bad_consequence(b)
    @pending_bad_consequence = b
  end
  
  def apply_prize(m)
    
  end
  
  def apply_bad_consequence(m)
    
  end
  
  def can_make_treasure_visible(t)
    if(t.get_type() == TreasureKind::ONEHAND)
      how_many_visible_treasures(t.get_type())!=2 && how_many_visible_treasures(TreasureKind::BOTHHANDS) == 0
    else
      if(t.get_type() == TreasureKind::BOTHHANDS)
          how_many_visible_treasures(TreasureKind::ONEHAND) == 0 && how_many_visible_treasures(TreasureKind::BOTHHANDS)
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
  end
  
  def dielf_no_treasures()
    if @visible_treasures.empty? && @hidden_treasures.empty?
      @dead = true 
    end
  end
  
  def give_me_a_treasure()
   random = Random.new
   @hidden_treasures.at(random.rand(@hidden_treasures.length))
  end
  
  def can_you_give_me_a_treasure()
    @visible_treasures.empty?
  end
  
  def have_stolen()
    @can_i_steeal = false
  end
  
 end
 
end
