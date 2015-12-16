# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'


# encoding: utf-8

module Napakalaki

class CardDealer
  include Singleton

  attr_reader :used_monsters,:used_treasures,:unused_treasures,:unused_monsters, :unused_cultists
  
  private #A partir de aquí, todo lo que viene acontinuación es privado
  def init_treasure_card_deck()
    
    #Creamos los dos arrays
    @unused_treasures = Array.new
    @used_treasures = Array.new
    
    @unused_treasures << Treasure.new('Si mi amo',4,[TreasureKind::HELMET])
    
    @unused_treasures << Treasure.new('Botas de investigacion',3,[TreasureKind::SHOES])
    
    @unused_treasures << Treasure.new('Capucha de Cthulhu',3,[TreasureKind::HELMET])
    
    @unused_treasures << Treasure.new('A prueba de babas',2,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Botas de lluvia acida',1,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Casco minero',2,[TreasureKind::HELMET])
    
    @unused_treasures << Treasure.new('Ametralladora Thompson',4,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Camiseta de la UGR',1,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Clavo de rail ferroviario',3,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Cuchilla de sushi arcano',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Fez alopodo',3,[TreasureKind::HELMET])
    
    @unused_treasures << Treasure.new('Hacha prehistorica',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('El aparato del Pr. Tesla',4,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Gaita',4,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Insecticida',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Escopeta de 3 canones',4,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Garabato mistico',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('La rebeca metalica',2,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Lanzallamas',4,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Necro-comicon',1,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Necronomicon',5,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Linterna a 2 manos',3,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Necro-gnomicon',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Necrotelecom',2,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Mazo de los antiguos',3,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Necro-playboycon',3,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Porra preternatural',2,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Shogulador',1,[TreasureKind::BOTHHANDS])
    
    @unused_treasures << Treasure.new('Varita de atizamiento',3,[TreasureKind::ONEHAND])
    
    @unused_treasures << Treasure.new('Tentaculo de pega',2,[TreasureKind::ARMOR])
    
    @unused_treasures << Treasure.new('Zapato deja-amigos',1,[TreasureKind::SHOES])
    
    shuffle_treasures()
    
end
  #PRIVADO
  #INICIA el mazo de cartas de MONSTRUOS
  def init_monster_card_deck()
    
  @unused_monsters = Array.new
  @used_monsters = Array.new
   
  #EL MAL INDECIBLE IMPRONUNCIABLE
  bc = BadConsequence.new_level_specific_treasures('Pierdes 1 mano visible',0,[TreasureKind.ONEHAND],[])
  prize = Prize.new(3,1);
  @unusedMonsters << Monster.new('El mal indecible impronunciable',10,bad_consequence,prize,-2)
        
  #Testigos oculares
  bc = BadConsequence.new_level_specific_treasures('Pierdes tus tesoros visibles. Ja ja ja.',0,[TreasureKind::ONEHAND,TreasureKind::BOTHHANDS,TreasureKind::HELMET,TreasureKind::ARMOR,TreasureKind::SHOES],[])
  prize = Prize.new(2,1);
  @unusedMonsters << Monster.new('Testigos oculares',6,bad_consequence,prize,2)
        
  #El gran cthulhu     
  prize = Prize.new(2, 5)
  bad_consequence = BadConsequence.new_death('Hoy no es tu dia de suerte. Mueres',true)
  @unused_monsters << Monster.new('El gran Cthulhu', 20, bad_consequence, prize,4)
        
  #Serpiente Político
  bc = BadConsequence.new_level_number_of_treasures('Tu gobierno te recorta 2 niveles',2 , 0, 0)
  prize = Prize.new(2,1);
  @unusedMonsters << Monster.new('Serpiente Político',8,bad_consequence,prize,-2)
        
  #Felpuggoth
  bc = BadConsequence.new_level_specific_treasures('Pierdes tu casco y tu armadura visible.Pierdes tus manos ocultas',0,[TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::BOTHHANDS])
  prize = Prize.new(1,1);
  @unusedMonsters << Monster.new('Felpuggoth',2,bad_consequence,prize,5)
        
  #Shoggoth
  bc = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles',2 , 0, 0)
  prize = Prize.new(4,1);
  @unusedMonsters << Monster.new('Shoggoth',16,bad_consequence,prize,-4)
        
  #Lolitagooth
  bc = BadConsequence.new_level_number_of_treasures('Pintalabios negro. Pierdes 2 niveles',2 , 0, 0)
  prize = Prize.new(1,1);
  @unusedMonsters << Monster.new('Lolitagooth',12,bad_consequence,prize,3)
  #EL REY ROSA
  prize = Prize.new(4,2) 
  bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
  @unused_monsters << Monster.new('El rey de rosa',13,bad_consequence,prize)

  #ANGELES DE LA NOCHE IBICENCA
  prize = Prize.new(4,1) 
  bad_consequence = BadConsequence.new_level_specific_treasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
  @unused_monsters << Monster.new('Angeles de la noche ibicenca',14,bad_consequence,prize)

  #3 BYAKHEES DE BONANZA
  prize = Prize.new(2,1) 
  bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
  @unused_monsters << Monster.new('3 Byakhees de bonanza', 8,bad_consequence,prize)


  #Chibithulhu
  prize = Prize.new(1,1) 
  bad_consequence = BadConsequence.new_level_specific_treasures('Embobados con el lindo primigenio te descartas de tu casco visible',0,[TreasureKind::HELMET],[])
  @unused_monsters << Monster.new('Chibithulhu', 2,bad_consequence,prize)


  #EL SOPOR DE DUNWICH
  prize = Prize.new(1,1) 
  bad_consequence = BadConsequence.new_level_specific_treasures('El primordial bostezo contagioso. Pierdes el calzado visible',0,[],[TreasureKind::SHOES])
  @unused_monsters << Monster.new('El sopor de Dunwich', 2,bad_consequence,prize)

  #EL GORRÓN EN EL UMBRAL
  prize = Prize.new(3,1) 
  bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes todos tus tesoros visibles', 0, BadConsequence.get_max_treasures(), 0)
  @unused_monsters << Monster.new('El gorron en el umbral', 10,bad_consequence,prize)

  #H.P. MUNCHCRAFT
  prize = Prize.new(2,1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la armadura visible', 0, [TreasureKind::ARMOR], [])
  @unused_monsters << Monster.new('H.P. Munchcraft', 6,bad_consequence,prize)

  #BICHGOOTH
  prize = Prize.new(1,1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0, [TreasureKind::ARMOR], [])
  @unused_monsters << Monster.new('Bichgooth',2,bad_consequence,prize)

  #LA QUE REDACTA EN LAS TINIEBLAS
  prize = Prize.new(1, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Toses los pulmones y pierdes 2 niveles', 2, [], [])
  @unused_monsters<< Monster.new('La que redacta en las tinieblas', 2, bad_consequence, prize)

  #LOS HONDOS
  prize = Prize.new(2, 1)
  bad_consequence = BadConsequence.new_death('Estos monstruos resultan bastanta superficieales y te aburren mortalmente.Estas muerto')
  @unused_monsters << Monster.new('Los hondos', 8, bad_consequence, prize)

  #SEMILLAS CTHULHU
  prize = Prize.new(2, 1)
  bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
  @unused_monsters << Monster.new('Semillas Cthulhu',4,bad_consequence, prize)

  #DAMEARGO
  prize = Prize.new(2, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible',0,[TreasureKind::ONEHAND],[])
  @unused_monsters << Monster.new('Dameargo', 1, bad_consequence, prize)

  #POLLIPÓLIPO VOLANTE
  prize = Prize.new(1, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Da mucho asquito. Pierdes 3 niveles',3,[],[])
  @unused_monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, prize)

  #YSKHTIHYSSG-GOTH
  prize = Prize.new(3, 1)
  bad_consequence = BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre.Estas muerto')
  @unused_monsters<< Monster.new('Yskhtihyssg-Goth', 12, bad_consequence, prize)

  #FAMILIA FELIZ
  prize = Prize.new(4, 1)
  bad_consequence = BadConsequence.new_death('La familia te atrapa.Estas muerto')
  @unused_monsters << Monster.new('Familia feliz', 1, bad_consequence, prize)

  #ROBOGGOTH
  prize = Prize.new(2, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], [])
  @unused_monsters << Monster.new('Roboggoth', 8, bad_consequence, prize)

  #El ESPIA
  prize = Prize.new(1, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], [])
  @unused_monsters << Monster.new('El espia', 5, bad_consequence, prize)

  #EL LENGUAS
  prize = Prize.new(1, 1)
  bad_consequence = BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
  @unused_monsters << Monster.new('El lenguas', 20, bad_consequence, prize)

  #BICÉFALO
  prize = Prize.new(1, 1)
  bad_consequence = BadConsequence.new_level_specific_treasures('Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos', 3, [TreasureKind::BOTHHANDS], [])
  @unused_monsters << Monster.new('Bicefalo ',20, bad_consequence, prize)
  
    shuffle_monsters()
  
 end
  def shuffle_cultists()
    random= Random.new
    for i in 0..@unused_cultists.length-1
      aux = @unused_cultists.at(i)
      rnd = random.rand(@unused_treasures.length)
      @unused_treasures[i] = @unused_treasures[rnd]
      @unused_treasures[rnd] = aux
    end
               
  end
  
  def init_cultist_card_deck()
    @unused_cultists = Array.new
    
    c = Cultist.new('Sectario1', 1)
    @unused_cultists << c
        
    c = Cultist.new('Sectario2', 2)
    @unused_cultists << c
    
     c = Cultist.new('Sectario3', 1)
    @unused_cultists << c
    
     c = Cultist.new('Sectario4', 2)
    @unused_cultists << c
    
     c = Cultist.new('Sectario5', 1)
    @unused_cultists << c
    
     c = Cultist.new('Sectario6', 1)
    @unused_cultists << c
        
    shuffle_cultists()
  end
  
  def shuffle_treasures()
    random = Random.new
    for i in 0..@unused_treasures.length-1
      aux = @unused_treasures.at(i)
      rnd = random.rand(@unused_treasures.length)
      @unused_treasures[i] = @unused_treasures[rnd]
      @unused_treasures[rnd] = aux
    end
  end
  
  #PRIVADO
  #BARAJAR mazo de MONSTRUOS
  def shuffle_monsters()
    random = Random.new
    for i in 0..@unused_monsters.length-1
      aux = @unused_monsters.at(i)
      rnd = random.rand(@unused_monsters.length)
      @unused_monsters[i] = @unused_monsters[rnd]
      @unused_monsters[rnd] = aux
    end
  end
  
  public #A partir de aquí, todo lo que viene acontinuación es públic
  #Obtiene el SIGUIENTE TESORO
  def next_treasure()
    if(@unused_treasures.empty?)
      @used_treasures.each { |item|  
        @unused_treasures << item
      }
      
      shuffle_treasures()
      
      @used_treasures.clear
    end
      
    t = @unused_treasures.at(0)
    
    @used_treasures << t
    
    @unused_treasures.delete(t)
    
    return t
  end
  
  #PUBLICO
  #Obtiene el siguiente MONSTRUO
  def next_monster()
    
    if(@unused_monsters.empty?)
      @used_monsters.each { |item|  
        @unused_monsters << item
      }
      shuffle_monsters()
      
      @used_monsters.clear
    end
      
    m = @unused_monsters.at(0)
    
    @used_monsters << m
    
    @unused_monsters.delete(m)
    
    return m
  end
  
  def next_cultist()
    
  end
  
  def give_treasure_back(t)
    @used_treasures << t
  end
  
  #PUBLICO
  #Mete el tesoro t en la BARAJA de MONSTRUOS USADOS
  def give_monster_back(m)
    @used_monsters << m
  end
  
  #PUBLICO
  #MÉTODO para INICIAR los dos mazos de cartas
  def init_cards()
    init_monster_card_deck()
    init_treasure_card_deck()
  end
  
end

end
