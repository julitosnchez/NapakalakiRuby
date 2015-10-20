# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  /*Declaración de arrays/
  attr_accesor :text,:levels,:n_visible_treasures,:n_hidden_treasures,:death
  @specific_hidden_treasures = Array.new
  @specific_visible_treasures = Array.new
  private_class_method :new
  
  /*Método initialize (No es el constructor pero lo invoca)/
  def initialize(a_text,some_levels,some_visible_treasures,some_hidden_treasures,some_specific_visible_treasures,some_specific_hidden_treasures,death)
    @text = a_text
    @levels = some_levels
    @n_visible_treasures = some_visible_treasures
    @n_hidden_treasures = some_hidden_treasures
    @specific_visible_treasures = some_specific_visible_treasures
    @specific_hidden_treasures = some_specific_hidden_treasures
    @death = death
  end
  /*Constructor 1 programado/
  def self.newLevelNumberOfTreasures(a_text,some_levels,some_visible_treasures,some_hidden_treasures)
    m = BadConsequence.new
    m.text = a_text
    m.levels = some_levels
    m.n_visible_treasures = some_visible_treasures
    m.n_hidden_treasures = some_hidden_treasures
    m
  end
  /*Constructor 2 programado/
  def self.newLevelSpecificTreasures(a_text,some_levels,some_specific_visible_treasures,some_specific_hidden_treasures)
    m = BadConsequence.new
    m.text = a_text
    m.levels = some_levels
    m.specific_visible_treasures = some_specific_visible_treasures
    m.specific_hidden_treasures = some_specific_hidden_treasures
    m
  end
  /*Constructor 3 programado/
  def self.newDeath(a_text)
    m = BadConsequence.new
    m.text = a_text
  end
  /*Metodo to_s/
  def to_s()
    "Descripcion carta: #{@tex}\n Nivel: #{@levels}\n Numero de tesoros visibles: #{@n_visible_treasures}\n Numero de tesoros escondidos: #{@n_hidden_treasures}\n
     Tesoros visibles: #{@specific_visible_treasures}\n Tesoros escondidos: #{@specific_hidden_treasures}\n Implica muerte: #{@death}"
  end
  /*Consultores/
  def text
    @text
  end
  def levels
    @levels
  end
  def nVisibleTreasures
    @n_visible_treasures
  end
  def nHiddenTreasures
    @n_hidden_treasures
  end
  def death
    @death
  end
  
end
