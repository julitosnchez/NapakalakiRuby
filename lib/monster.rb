# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'

module Napakalaki
  
  class Monster
    attr_accessor :name,:combat_level,:prize,:bad_consequence
    def initialize(name,level,bc,price)
      @name = name
      @combat_level = level
      @prize = price
      @bad_consequence = bc
    end
    #Método to_s
    def to_s()
      "Nombre del monstruo: #{@name}\nNivel de combate: #{@combat_level}\n#{@prize}\n#{@bad_consequence}"
    end
    #Consultor
    def get_levels_gained()
      @prize.levels()
    end
    
    def get_BC()
      @bad_consequence
    end
    
    def get_prize()
      @prize
    end
  
    def get_treasures_gained()
      @prize.get_treasures()
    end
  
  end
end
