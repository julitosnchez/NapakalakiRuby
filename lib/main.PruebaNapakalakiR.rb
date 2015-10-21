# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize.rb'
require_relative 'bad_consequence.rb'
require_relative 'monster.rb'
#encoding: utf­8


#Declaracion de array de monstruos
monsters = Array.new

#EL REY ROSA
price = Prize.new(4,2) 
badConsequence = BadConsequence.new_level_number_of_treasures('Pierdes 
5 niveles y 3 tesoros visibles',5 , 3, 0)
monsters << Monster.new('El rey de rosa',13,prize,badConsequence)

#ANGELES DE LA NOCHE IBICENCA
prize = Prize.new(4,1) 
badConsequence = BadConsequence.new_level_specific_treasures ('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
monsters << Monster.new('Ángeles de la noche ibicenca', 14, prize,badConsequence)

#3 Byakhees de bonanza
prize = Prize.new(2,1) 
badConsequence = BadConsequence.new_level_specific_treasures ('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
monsters << Monster.new('3 Byakhees de bonanza', 8, prize,badConsequence)

#Chibithulhu
prize = Prize.new(1,1) 
badConsequence = BadConsequence.new_level_specific_treasures ('Embobados con el lindo
primigenio te descartas de tu casco
visible',0,[TreasureKind::HELMET],[])
monsters << Monster.new('Chibithulhu', 2, prize,badConsequence)

#EL SOPOR DE DUNWICH
prize = Prize.new(1,1) 
badConsequence = BadConsequence.new_level_specific_treasures ('El primordial bostezo
contagioso. Pierdes el calzado visible',0,[],[TreasureKind::SHOES])
monsters << Monster.new('El sopor de Dunwich', 2, prize,badConsequence)

#EL GORRÓN EN EL UMBRAL
prize = Prize.new(3,1) 
badConsequence = BadConsequence.new_level_specific_treasures ('Pierdes todos tus tesoros
visibles',0,[TreasureKind::ARMOR,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS,TreasureKind::HELMET,TreasureKind::SHOES],[])
monsters << Monster.new('El gorrón en el umbral', 10, prize,badConsequence)
