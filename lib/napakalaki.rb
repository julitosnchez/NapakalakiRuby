# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
include Singleton

module Napakalaki
  class Napakalaki
    attr_reader :current_monster, :current_player, :dealer
    @@instance

    private

    def initialize(current_monster,current_player,dealer)
      @current_monster = current_monster
      @current_player = current_player
      @players = Array.new
      @dealer = dealer
    end

    def init_players(names)
      names.each{ |n|
        @players.push(Player.new(n))
      }
    end

    def next_player
      random = Random.new
      if (@players.at(0) == @current_player)
        @players.at(random.rand(@players.length))
      else
        index = @players.index(@current_player)
        
        if (index == @players.length-1)
          @players.at(0)
        else
          @players.at(index)
        end
      end
    end

    def next_turn_allowed
      @current_player.valid_state()
    end

    def set_enemies
      random = Random.new
      i = 0
      while(i< @players.length)
        index = random.rand(@players.length)
        if (i != index)
          @players.at(i).set_enemy(@players.at(index))
          i = i+1
        end
      end
    end

    public

    def develop_combat
      result = @current_player.combat(@current_monster)
      dealer = CardDealer.instance
      dealer.give_monster_back(@current_monster)
      result
    end

    def discard_visible_treasures(treasures)
      dealer = CardDealer.instance
      treasures.each { |t|
        @current_player.discard_visible_treasure(t)
        dealer.give_treasure_back(t)
      }
    end

    def discard_hidden_treasures(treasures)
      dealer = CardDealer.instance
      treasures.each { |t|
        @current_player.discard_hidden_treasure(t)
        dealer.give_treasure_back(t)
      }
    end

    def make_treasures_visible(treasures)
      treasures.each { |treasure|
        @current_player.make_treasure_visible(treasure)
      }
    end

    def init_game(players)
      init_players(players)
      set_enemies()
      dealer = CardDealer.instance
      dealer.init_cards()
    end

    def get_current_player()
      @current_player
    end

    def get_current_monster()
      @current_monster
    end

    def next_turn
      state_ok = next_turn_is_allowed()
      dealer = CardDealer.instance
      if (state_ok)
        @current_monster = dealer.next_monster()
        @current_player = next_player()
        dead = @current_player.is_dead()
        if (dead)
          @current_player.init_treasures()
        end
      end
      state_ok
    end

    def end_of_game(result)
      result == CombatResult::WINGAME
    end
  end
end
