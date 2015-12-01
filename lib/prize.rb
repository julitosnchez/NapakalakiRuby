# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class Prize
  attr_reader :treasures,:level
  
  def initialize(treasures,level)
    @treasures = treasures
    @level = level
  end
  
  def levels()
    @level
  end
  
  def to_s()
    "Tesoros ganados: #{@treasures}\nNiveles ganados: #{@levels}"
  end
  
  
end

