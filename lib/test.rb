# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# encoding: utf-8

require 'singleton'
require_relative 'napakalaki.rb'

module Test
    module Command  
    class Option
      attr_reader :menu, :text
      def initialize (aValue, aText)
        @menu = aValue
        @text = aText
      end
    end
    
    Exit = Option.new(0, "Salir")
    GoBack = Option.new(-1, "Menu anterior")
    Combat = Option.new(69, "COMBATIR")
    ShowMonster = Option.new(10, "Mostrar monstruo")
    ShowVisibleTreasure = Option.new(11, "Mostrar tesoros visibles")
    ShowHiddenTreasure = Option.new(12, "Mostrar tesoros ocultos") 
    DiscardVisibleTreasure = Option.new(21, "Descartar tesoro visible")
    DiscardHiddenTreasure = Option.new(22, "Descartar tesoro oculto")
    DiscardAll = Option.new(23, "Descartar TODOS los tesoros")
    MakeTreasureVisible = Option.new(31, "Equipar tesoro")
    StealTreasure = Option.new(32, "Robar tesoro")
    NextTurn = Option.new(1, "Siguiente turno")
    NextTurnAllowed = Option.new(2, "Siguiente turno permitido")
    
  end # del modulo Command
  
  class GameTester

  include Singleton
 
  public
  def play(aGame, numberOfPlayers)
    
    @game = aGame
    names = getPlayerNames(numberOfPlayers)
    @game.init_game(names) 
    
    begin #Mientras dure la partida
      currentPlayer=@game.get_current_player()
      begin #Mientras el jugador se decide a conocer al monstruo
        puts "******* ******* ******* ******* ******* ******* *******"
        puts "\n\n Turno de: " + currentPlayer.to_s() 
        command = getCommandBeforeKnowingMonster()
        command = processCommand(command, currentPlayer)        
      end while (command != Command::Exit && command != Command::ShowMonster)
      if (command == Command::ShowMonster) then
        begin #Mientras el jugador se decida a combatir 
          puts "******* ******* ******* ******* ******* ******* *******"
          puts "\n\n Turno de: " + currentPlayer.to_s()
          command = getCommandBeforeFighting()
          command = processCommand(command, currentPlayer)
        end while (command != Command::Exit && command != Command::Combat)
        if (command == Command::Combat) then
          combatResult = @game.develop_combat()
          case combatResult
            when NapakalakiGame::CombatResult::WINGAME then 
              puts "\n\n       " + currentPlayer.get_name()
              puts "\n\n HAS GANADO LA PARTIDA"
              #break estÃ¡ implÃ­cito            
            when NapakalakiGame::CombatResult::WIN then
              puts "\n\n Ganaste el combate"
            when NapakalakiGame::CombatResult::LOSE then
              puts "\n\n Has perdido el combate, te toca cumplir el mal rollo"
           end #case
           if (combatResult != NapakalakiGame::CombatResult::WINGAME) then
            begin #Hasta que se avance de turno 
              puts "******* ******* ******* ******* ******* ******* *******"
              puts "\n\n Turno de: " + currentPlayer.to_s()
              if currentPlayer.can_i_steal() then
                command = getCommandAfterFighting()
              else
                command = getCommandAfterFightingNoSteal()
              end
              command = processCommand(command, currentPlayer)
            end while (command != Command::Exit && command != Command::NextTurnAllowed)
          else 
            command = Command::Exit;
          end #if WINGAME  
        end #if COMBAT
      end #if SHOWMOnSTER
    end while (command != Command::Exit) #mientras dure la partida

  end
  
  private
  
  def getCommandAfterFighting()
      commands = [Command::ShowMonster, Command::ShowVisibleTreasure, Command::ShowHiddenTreasure, 
      Command::DiscardVisibleTreasure, Command::DiscardHiddenTreasure, Command::DiscardAll,
      Command::MakeTreasureVisible, Command::StealTreasure, Command::NextTurn, Command::Exit]
      manageMenu("Opciones antes de pasar turno", commands)
  end
  
  def getCommandAfterFightingNoSteal()
      commands = [Command::ShowMonster, Command::ShowVisibleTreasure, Command::ShowHiddenTreasure, 
      Command::DiscardVisibleTreasure, Command::DiscardHiddenTreasure, Command::DiscardAll,
      Command::MakeTreasureVisible, Command::NextTurn, Command::Exit]
      manageMenu("Opciones antes de pasar turno", commands)
  end
  
  def getCommandBeforeFighting ()
      commands = [Command::ShowMonster, Command::ShowVisibleTreasure, Command::ShowHiddenTreasure, 
      Command::Combat, Command::Exit]
      manageMenu("Opciones antes de combatir", commands)
  end
  
  def getCommandBeforeKnowingMonster () 
      commands = [Command::ShowMonster,Command::ShowVisibleTreasure, Command::ShowHiddenTreasure, 
      Command::MakeTreasureVisible,  Command::Exit]      
      manageMenu("Opciones antes de conocer al monstruo", commands)
  end
  
  def getPlayerNames (numberOfPlayers) 
    names = Array.new
    for i in 1..numberOfPlayers
      puts "Escribe el nombre del jugador #{i}: "
      names << gets.chomp
    end
    names
  end

  def getTreasure (howMany) 
    
    validInput = true
    option = Command::GoBack.menu
    puts "\n Elige un tesoro: "
    capture = gets.chomp
    
    begin #tratar la excepcion
      option = Integer(capture)
      if (option < Command::GoBack.menu || option > howMany) then #no se ha escrito un entero en el rango permitido
        validInput = false
      end
    rescue Exception => e  
      validInput = false
    end
    
    if (! validInput) then
      inputErrorMessage() 
      return -2  # Muestra de nuevo el menu y pide otra entrada
    end
    option
  end
  
  def inputErrorMessage () 
    puts "\n\n ERROR !!! \n\n Seleccion erronea. Intentalo de nuevo.\n\n"
  end
    
  def manageDiscardTreasures (visible, aPlayer)
     
    begin #Se descartan tesoros hasta que se vuelve al menÃƒÂº anterior
      if visible then
        howMany = showTreasures("Elige tesoros visibles para descartar", aPlayer.get_visible_treasures(), true)
      else 
        howMany = showTreasures("Elige tesoros ocultos para descartar", aPlayer.get_hidden_treasures(), true)
      end
      option = getTreasure (howMany)
      if (option > -1) then 
        if visible then
          @game.discard_visible_treasures ([aPlayer.get_visible_treasures().at(option)])
        else
          @game.discard_hidden_treasures ([aPlayer.get_hidden_treasures().at(option)])          
        end
      end
    end while (option != -1)  
  end
  
  def manageMakeTreasureVisible (aPlayer)
       
    begin #Se hacen tesoros visibles hasta que se vuelve al menÃƒÂº anterior
      howMany = showTreasures("Elige tesoros para intentar hacerlos visibles", aPlayer.get_hidden_treasures(), true)
      option = getTreasure (howMany);
      if (option > -1) then
        aPlayer.make_treasure_visible (aPlayer.get_hidden_treasures()[option])
      end
    end while (option != -1)
  end
  
  def manageMenu (message, menu) 
    menuCheck = Hash.new #Para comprobar que se hace una selecciÃƒÂ³n vÃƒÂ¡lida
    menu.each do |c|
      menuCheck [c.menu] = c
    end    
    begin #Hasta que se hace una selecciÃƒÂ³n vÃƒÂ¡lida
      validInput = true
      option = Command::GoBack.menu
      puts ("\n\n------- ------ ------ ------ ------ ------ ------")
      puts "**** " + message + " ****\n"
      menu.each do |c| #se muestran las opciones del menÃƒÂº
        puts "#{c.menu}" + " : " + c.text
      end
      puts "\n Elige una opcion: "
      capture = gets.chomp
      begin
        option = Integer(capture)
        if (! menuCheck.has_key?(option)) #No es un entero entre los vÃƒÂ¡lidos
          validInput = false
        end
      rescue Exception => e  #No se ha introducido un entero
        validInput = false
      end  
      
      if (! validInput) then
        inputErrorMessage()
      end
    end while (! validInput)
    menuCheck[option]    
  end
    
  def processCommand (command, aPlayer) 
    case command 
      when Command::Exit then 
        puts "exit"
      when Command::Combat then
        puts "combat"
#        puts "pulsa enter para seguir"
#        gets
      when  Command::ShowMonster then 
        puts "\n------- ------- ------- ------- ------- ------- ------- "
        puts "El monstruo actual es:\n\n" + @game.get_current_monster().to_s()
#        puts "pulsa enter para seguir"
#        gets
      when Command::ShowVisibleTreasure then
        showTreasures("Esta es tu lista de tesoros visibles", aPlayer.get_visible_treasures(), false)
#        puts "pulsa enter para seguir"
#        gets
      when Command::ShowHiddenTreasure then
        showTreasures("Esta es tu lista de tesoros ocultos", aPlayer.get_hidden_treasures(), false)
#        puts "pulsa enter para seguir"
#        gets
      when Command::MakeTreasureVisible then
        manageMakeTreasureVisible (aPlayer)
#        puts "pulsa enter para seguir"
#        gets
      when Command::DiscardVisibleTreasure then
        manageDiscardTreasures(true, aPlayer)
#        puts "pulsa enter para seguir"
#        gets
      when Command::DiscardHiddenTreasure then
        manageDiscardTreasures(false, aPlayer)
#        puts "pulsa enter para seguir"
#        gets
      when Command::DiscardAll then
        aPlayer.discard_all_treasures()
      when Command::StealTreasure then
        aTreasure = aPlayer.steal_treasure();
        if aTreasure == nil
          puts "\n\n No has podido robar nada \n\n"
        else
          puts "\n\n Has robado este tesoro: \n\n #{aTreasure.to_s}"
        end
      when Command::NextTurn then
        if ! @game.next_turn() then
          puts "\n\n ERROR \n"
          puts "No cumples las condiciones para pasar de turno."
          puts "O bien tienes mas de 4 tesoros ocultos"
          puts "O bien te queda mal rollo por cumplir"
        else 
          command = Command::NextTurnAllowed
        end
#        puts "pulsa enter para seguir"
#        gets
    end
    command
  end
  
  def showTreasures (message, treasures, menu)
    optionMenu = Command::GoBack.menu

    puts "\n------- ------- ------- ------- ------- ------- -------"
    puts message 
    if menu then
      puts "\n #{Command::GoBack.menu} : " + Command::GoBack.text
    end
    treasures.each do |t|
      optionMenu = optionMenu + 1
      if (menu)
         puts "\n" + optionMenu.to_s() + ":" + t.to_s()
      else 
         puts "\n" + t.to_s()
      end
     
    end
    optionMenu
  end
 
 end #clase
  
end
