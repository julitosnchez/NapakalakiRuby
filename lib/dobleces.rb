# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Dobleces
    class AlterEgo
      @@descripcion = "En alter ego es una personalidad alternativa y los monstruos tambien pueden tener amigos"
      attr_reader :nivel_de_bondad
      public :nivel_de_bondad
      
      def initialize(bondad,amigos)
        @nivel_de_bondad = bondad
        @monstruos_amigos = amigos;
      end
      
      def self.new1(bondad,amigos)
        new(bondad,amigos)
      end
      
      def self.new2(bondad)
        new(bondad,Array.new)
      end
      
      def to_s()
        "NivelBondad #{@nivel_de_bondad}.Numero de amigos #{@monstruos_amigos.length}"
      end
      
      def get_nivel_bondad()
       @nivel_de_bondad
      end
  end
end