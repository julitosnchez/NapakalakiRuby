# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Dobleces
    class AlterEgo
      @@descripcion = "en alter ego es una personalidad alternativa y los monstruos tambien pueden tener amigos"
      @monstruos_amigos = Array.new
      attr_reader :nivel_de_bondad
      public :nivel_de_bondad
      
      def new(bondad,amigos)
        m = AlterEgo.new
        m.nivel_de_bondad = bondad
        m.monstruos_amigos = amigos
        m
      end
      
      def new2(bondad)
        m = AlterEgo.new
        m.nivel_de_bondad = bondad;
        m
      end
      
      def to_s()
        "NivelBondad #{nivel_de_bondad}.Numero de amigos #{monstruos_amigos.length}"
      end
      
      
      def get_nivel_bondad
       nivel_de_bondad
      end
  end
end