# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class Dice
    include Singleton
    @@instance = Dice.instance
    public
    def next_number()
      random = Random.new
      rnd = random.rand(6)+1
      rnd
    end
  end
  
end
