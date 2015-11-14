# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'award.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'
include Award

#encoding: utf­8


#Declaracion de array de monstruos
monsters = Array.new


#EL REY ROSA
prize = Prize.new(4,2) 
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters << Monster.new('El rey de rosa',13,bad_consequence,prize)

#ANGELES DE LA NOCHE IBICENCA
prize = Prize.new(4,1) 
bad_consequence = BadConsequence.new_level_specific_treasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters << Monster.new('Angeles de la noche ibicenca',14,bad_consequence,prize)

#3 BYAKHEES DE BONANZA
prize = Prize.new(2,1) 
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
monsters << Monster.new('3 Byakhees de bonanza', 8,bad_consequence,prize)


m = Array.new

m << '1'
m << '2'

puts m.length


Monster.prueba(m)


=begin
#Chibithulhu
prize = Prize.new(1,1) 
bad_consequence = BadConsequence.new_level_specific_treasures('Embobados con el lindo primigenio te descartas de tu casco visible',0,[TreasureKind::HELMET],[])
#monsters << Monster.new('Chibithulhu', 2,bad_consequence,prize)


#EL SOPOR DE DUNWICH
prize = Prize.new(1,1) 
bad_consequence = BadConsequence.new_level_specific_treasures('El primordial bostezo contagioso. Pierdes el calzado visible',0,[],[TreasureKind::SHOES])
monsters << Monster.new('El sopor de Dunwich', 2,bad_consequence,prize)

#EL GORRÓN EN EL UMBRAL
prize = Prize.new(3,1) 
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes todos tus tesoros visibles',0,[TreasureKind::ARMOR,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS,TreasureKind::HELMET,TreasureKind::SHOES],[])
monsters << Monster.new('El gorron en el umbral', 10,bad_consequence,prize)

#H.P. MUNCHCRAFT
prize = Prize.new(2,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Pierdes la armadura visible', 0, [TreasureKind::ARMOR], [])
monsters << Monster.new('H.P. Munchcraft', 6,bad_consequence,prize)

#BICHGOOTH
prize = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0, [TreasureKind::ARMOR], [])
monsters << Monster.new('Bichgooth',2,bad_consequence,prize)

#LA QUE REDACTA EN LAS TINIEBLAS
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Toses los pulmones y pierdes 2 niveles', 2, [], [])
monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence, prize)

#LOS HONDOS
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_death('Estos monstruos resultan bastanta superficieales y te aburren mortalmente.Estas muerto')
monsters << Monster.new('Los hondos', 8, bad_consequence, prize)

#SEMILLAS CTHULHU
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
monsters << Monster.new('Semillas Cthulhu',4,bad_consequence, prize)

#DAMEARGO
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te intentas escaquear. Pierdes una mano visible',0,[TreasureKind::ONEHAND],[])
monsters << Monster.new('Dameargo', 1, bad_consequence, prize)

#POLLIPÓLIPO VOLANTE
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Da mucho asquito. Pierdes 3 niveles',3,[],[])
monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, prize)

#YSKHTIHYSSG-GOTH
prize = Prize.new(3, 1)
bad_consequence = BadConsequence.new_death('No le hace gracia que pronuncien mal su nombre.Estas muerto')
monsters << Monster.new('Yskhtihyssg-Goth', 12, bad_consequence, prize)

#FAMILIA FELIZ
prize = Prize.new(4, 1)
bad_consequence = BadConsequence.new_death('La familia te atrapa.Estas muerto')
monsters << Monster.new('Familia feliz', 1, bad_consequence, prize)

#ROBOGGOTH
prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible', 2, [TreasureKind::BOTHHANDS], [])
monsters << Monster.new('Roboggoth', 8, bad_consequence, prize)

#El ESPIA
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], [])
monsters << Monster.new('El espia', 5, bad_consequence, prize)

#EL LENGUAS
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_number_of_treasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
monsters << Monster.new('El lenguas', 20, bad_consequence, prize)

#BICÉFALO
prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_level_specific_treasures('Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos', 3, [TreasureKind::BOTHHANDS], [])
monsters << Monster.new('Bicefalo ',20, bad_consequence, prize)

#Monstruos con un nivel de combate superior a 10
monsters.each do |monstruo|
  if monstruo.combat_level > 10
    puts monstruo
  end
end

#Monstruos que tengan un mal rollo que sólo implique pérdida de niveles
monsters.each do |monstruo| 
  if monstruo.bc.levels!=0 && monstruo.bc.n_visible_treasures==0 && monstruo.bc.n_hidden_treasures==0 && monstruo.bc.get_specific_hidden_treasures().empty? && monstruo.bc.get_specific_visible_treasures().empty?;
      puts monstruo
  end
end

#Monstruos con un buen rollo que implique una ganancia de niveles superior a 1
monsters.each { |monstruo| if monstruo.prize.level > 1; puts monstruo end }

#Monstruos que tengan un malo rollo que suponga pérdida de undeterminado tipo de tesoros visibles y/o ocultos
monsters.each do |monstruo|
  puts monstruo if !monstruo.bc.get_specific_hidden_treasures().empty? || !monstruo.bc.get_specific_visible_treasures().empty?
end

=end

