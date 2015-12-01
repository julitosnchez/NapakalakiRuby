# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind.rb'
require_relative 'player.rb'

module Napakalaki
  
  class BadConsequence
    #Declaración de arrays
    attr_accessor :text,:levels,:n_visible_treasures,:n_hidden_treasures,:death
    @@MAX_TREASURES = 10
    @specific_hidden_treasures = Array.new
    @specific_visible_treasures = Array.new
    private_class_method :new
    
    #Método initialize (No es el constructor pero lo invoca)
    def initialize(a_text,some_levels,some_visible_treasures,some_hidden_treasures,some_specific_visible_treasures,some_specific_hidden_treasures,death)
      @text = a_text
      @levels = some_levels
      @n_visible_treasures = some_visible_treasures
      @n_hidden_treasures = some_hidden_treasures
      @specific_visible_treasures = some_specific_visible_treasures
      @specific_hidden_treasures = some_specific_hidden_treasures
      @death = death
    end
    #Constructor 1 programado
    def self.new_level_number_of_treasures(a_text,some_levels,some_visible_treasures,some_hidden_treasures)
      new(a_text,some_levels,some_visible_treasures,some_hidden_treasures,Array.new,Array.new,false)
    end
    #Constructor 2 programado
    def self.new_level_specific_treasures(a_text,some_levels,some_specific_visible_treasures,some_specific_hidden_treasures)
      new(a_text,some_levels,0,0,some_specific_visible_treasures,some_specific_hidden_treasures,false)
    end
    #Constructor 3 programado
    def self.new_death(a_text)
      new(a_text,Player.MAX_LEVEL,@@MAX_TREASURES,@@MAX_TREASURES,Array.new,Array.new,true)
    end
    #Metodo to_s
    def to_s()
      "Descripcion carta: #{@text}\nNivel: #{@levels}\nNumero de tesoros visibles: #{@n_visible_treasures}\nNumero de tesoros escondidos: #{@n_hidden_treasures}\nTesoros visibles: #{@specific_visible_treasures}\nTesoros escondidos: #{@specific_hidden_treasures}\nImplica muerte: #{@death}\n\n"
    end

    def self.get_max_treasures
      @@MAX_TREASURES
    end

    def get_specific_hidden_treasures()
      @specific_hidden_treasures
    end

    def get_specific_visible_treasures()
      @specific_visible_treasures
    end

    def is_empty()
      if @levels == 0 && @n_visible_treasures == 0 && @n_hidden_treasures == 0 && death == false && @specific_hidden_treasures.empty? && @specific_visible_treasures.empty?
        return true
      end
      return false
    end

    def get_levels()
      @levels
    end

    def get_n_visible_treasures()
      @n_visible_treasures
    end

    def get_n_hidden_treasures()
      @n_hidden_treasures
    end

    def substract_visible_treasure(t)
      if(@n_visible_treasures > 0)
        @n_visible_treasures = @n_visible_treasures-1
      else
        if(@specific_visible_treasures.count(t.get_type()) != 0)
          @specific_visible_treasures.delete(t.get_type())
        end
      end
    end

    def substract_hidden_treasure(t)
      if(@n_hidden_treasures > 0)
        @n_hidden_treasures = @n_hidden_treasures-1
      else
        if(@specific_hidden_treasures.count(t.get_type()) != 0)
          @specific_hidden_treasures.delete(t.get_type())
        end
      end
    end

    def adjust_to_fit_treasure_lists(v,h)
      tkv = Array.new
      tkh = Array.new
      
      v.each { |i|
        tkv << i.get_type()
      }
      
      h.each { |e|
        tkh << e.get_type()
      }
      
      if (@n_hidden_treasures!=0 || @n_visible_treasures!=0)
        nvisible = 0;
        nhidden = 0;
        
        if (@n_visible_treasures > 0)
          if (@n_visible_treasures > tkv.length)
            nvisible = tkv.length
          else
            nvisible = @n_visible_treasures
          end
        end
        
        if (@n_hidden_treasures>0)
          if (@n_hidden_treasures > tkh.length)
            nhidden = tkh.length
          else
            nhidden = @n_hidden_treasures
          end
        end
        bc = BadConsequence.new_level_specific_treasures(@text,0,nvisible,nhidden)
      else
        visible_treasures = Array.new
        hidden_treasures = Array.new
        
        if(@specific_visible_treasures.empty? == false)
          @specific_visible_treasures.each { |i|
            if(tkv.include?(i))
              visible_treasures << i
            end
          }
        end
        
        if (@specific_hidden_treasures.empty? == false)
          @specific_hidden_treasures.each { |e|
            if(tkh.include?(e))
              hidden_treasures << e
            end
          }
        end
        bc = BadConsequence.new_level_specific_treasures(@text,0,visible_treasures,hidden_treasures)
      end
      
      return bc
    end
    
  end
  
end
