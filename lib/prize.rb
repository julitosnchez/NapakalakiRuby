# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_accesor :treasures,:level
  def initialize(treasur,lvel)
    @treasures = treasur
    @level = lvel
  end
  def to_s()
    "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@levels}"
  end
end
