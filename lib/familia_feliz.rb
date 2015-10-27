# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class FamiliaFeliz
  attr_accessor :fam
 
  N_MAX_FAMILIARES = 5
  def initialize(familia)
    @fam = Array.new
    i = 0
    while i < N_MAX_FAMILIARES do
      if(i < familia.length)
        @fam.push(familia[i])
      end
      i = i+1
    end
  end
  
  def get_media()
    suma = 0
    fam.each do |m|
      suma += m.combat_level
    end
    (suma*1.0)/fam.length
  end
  
  def add(m)
    if(fam.length < N_MAX_FAMILIARES)
      fam << m
    end
  end
  
end
