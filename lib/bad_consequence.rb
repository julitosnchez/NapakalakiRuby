# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

class BadConsequence
  @@MAXTREASURES = 10
  attr_accessor :text,:levels,:n_visible_treasures,:n_hidden_treasures,:death
  #Declaración de arrays
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
    new(a_text,0,0,0,Array.new,Array.new,true)
  end
  
  #Metodo to_s
  def to_s()
    "Descripcion carta: #{@text}\nNiveles perdidos: #{@levels}\nNumero de tesoros visibles: #{@n_visible_treasures}\nNumero de tesoros escondidos: #{@n_hidden_treasures}\nTesoros visibles: #{@specific_visible_treasures}\nTesoros escondidos: #{@specific_hidden_treasures}\nImplica muerte: #{@death}\n\n"
  end
  #Consultores
  def self.get_max_treasures()
    @@MAXTREASURES
  end
  
  def get_specific_hidden_treasures()
    @specific_hidden_treasures
  end
  
  def get_specific_visible_treasures()
    @specific_visible_treasures
  end
  
  def is_empty()
    b = false
    if @levels == 0 && @n_visible_treasures == 0 && @n_hidden_treasures == 0 && death == false && @specific_hidden_treasures.empty? && @specific_visible_treasures.empty?
      b = true
    end
    b
  end
  
  def get_levels()
    @levels
  end
  
  def get_n_visible_treasures
    @n_visible_treasures
  end
  
  def get_n_hidden_treasures
    @n_hidden_treasures
  end
  
  def substract_visible_treasures(t)
    if(@specific_visible_treasures.count(t.get_type()) != 0)
      @specific_visible_treasures.delete(t.get_type())
    end
  end
  
  def substract_hidden_treasure(t)
    if(@specific_hidden_treasures.count(t.get_type()) != 0)
      @specific_hidden_treasures.delete(t.get_type())
    end
  end
  
  def adjust_to_fit_treasure_lists(v,h)
    
  end
  
 end
 
end
