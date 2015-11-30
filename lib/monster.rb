# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
  class Monster
    attr_accessor :name,:combat_level,:prize,:bc
    def initialize(name,level,bc,price)
      @name = name
      @combat_level = level
      @prize = price
      @bc = bc
    end

    def get_levels_gained
      @prize.level
    end
    
    def get_prize
      @prize
    end

    def get_treasures_gained
      @prize.get_treasures
    end

    #Método to_s
    def to_s()
      "Nombre del monstruo: #{@name}\nNivel de combate: #{@combat_level}\n#{@prize}\n#{@bc}"
    end
  end
end
