# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  MAX_LEVEL = 10
  atr_reader :name,:level,:dead,:can_i_steal,:visible_treasures,:hidden_treasures
  @visible_treasures = Array.new
  @hidden_treasures = Array.new
  @pending_bad_consequence
  @enemy
  
  def initialize(name)
    
  end
  
  def combat(m)
    
  end
  
  def make_treasure_visible(t)
    
  end
  
  def discard_visible_treasure(t)
    
  end
  
  def valid_state()
    
  end
  
  def init_treasures()
    
  end
  
  def steal_treasure()
    
  end
  
  def set_enemy(enemy)
    
  end
  
  def discard_all_treasures()
    
  end
  
  private
  def bring_to_life()
    
  end
  
  def get_combat_level()
    
  end
  
  def increment_levels(l)
    
  end
  
  def decrement_levels(l)
    
  end
  
  def set_pending_bad_consequence(b)
    
  end
  
  def apply_prize(m)
    
  end
  
  def apply_bad_consequence(m)
    
  end
  
  def can_make_treasure_visible(t)
    
  end
  
  def how_many_visible_treasures(t_kind)
    
  end
  
  def dielf_no_treasures()
    
  end
  
  def give_me_a_treasure()
    
  end
  
  def can_you_give_me_a_treasure()
    
  end
  
  def have_stolen()
    
  end
  
end
