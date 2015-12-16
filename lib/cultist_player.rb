# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
 
  class CultistPlayer < Player
    @@total_cultist_players = 0
    attr_reader :my_cultist_card,:total_cultist_players
    
    def initialize(p,c)
      super(p)
      @my_cultist_card = c
      @@total_cultist_players = @@total_cultist_players+1
    end
    
    protected
    def give_me_a_treasure()
      random = Random.new
      vt = Array.new
      vt = super.get_visible_treasures
      index = random.rnd(vt.length)
      return vt.at(index)
    end
    
    def can_you_give_me_a_treasure()
      return super.enemy.get_visible_treasures().is_empty() == false
    end
    
    def get_oponent_level(m)
      return m.get_combat_level_against_cultist_player()
    end
    
    def should_convert()
      return false
    end
    
    def get_combat_level()
      return super.get_combat_level()+0.2*super.get_combat_level()+@my_cultist_card.get_gained_levels()*@@total_cultist_players
    end
    
    public
    def self.get_total_cultist_players()
     @@total_cultist_player 
    end
    
  end
end