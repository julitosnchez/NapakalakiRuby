# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'award.rb'
include Award



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
    "Nombre del monstruo: #{@name}\nNivel de combate: #{@combat_level}\n#{@prize}\n#{@bc}"
  end
  #Consultor
  def get_levels_gained()
    @prize.level
  end
  
  def get_treasures_gained()
    @prize.get_treasures()
  end
 
  
  #EXAM-INICIO
  private
  def conditional_put(un_array)
    un_array.each { |i| 
      if i < @prize.get_treasures()
        puts i
      end
      
    }
  end

end
