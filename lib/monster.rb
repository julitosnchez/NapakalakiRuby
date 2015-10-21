# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  attr_accessor :name,:combat_level,:prize,:bc
  def initialize(name,level,bc,price)
    @name = name
    @combat_level = level
    @prize = price
    @bc = bc
  end
  #Método to_s
  def to_s()
    "Nombre del monstruo: #{@name}\n Nivel de combate: #{@combat_level}\n
     Buen rollo #{@prize}\n Mal rollo: #{@bc}"
  end
end
