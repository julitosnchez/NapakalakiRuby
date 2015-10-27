# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class FamiliaFeliz
  attr_accessor :family
  @family = Array.new
  N_MAX_FAMILIARES = 5
  def initialize(familia)
    i = 0
    arr = Array.new
    while i < N_MAX_FAMILIARES do
      if(i < familia.length)
        arr.push(familia[i])
      end
    end
    @family = arr
  end
  
end
