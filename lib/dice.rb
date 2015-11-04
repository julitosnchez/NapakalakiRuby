# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class Dice
  @@instance = Dice.instance
  
  private
  def initialize
    
  end
  
  public
  def get_instance()
    @@instance
  end
  
  def next_number()
    
  end
end
