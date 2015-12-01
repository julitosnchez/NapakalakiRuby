# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind.rb'

module Napakalaki

  class Treasure
    def initialize(n,bonus,t)
      @name = n
      @bonus = bonus
      @type = t
    end
  
    def get_type()
      @type
    end
  
    def get_bonus()
      @bonus
    end
  
    def get_name()
      @name
    end
    
    def to_s
      "#{@name}#{@type}--bonus--> #{@bonus}"
    end
  
  end
end
