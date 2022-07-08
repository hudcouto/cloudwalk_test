# frozen_string_literal: true

require_relative './user'
require_relative './kill'
require_relative '../score/calculator'

module Lib
  module Models
    class Match
      attr_reader :players, :kills

      def initialize
        @players = []
        @kills = []
      end

      def find_or_create_player(id:, name:)
        if @players.find { |player| player.id == id }
          player = @players.find { |player| player.id == id }
          player.name = name
        else
          player = User.new(id: id.to_i, name:)
          @players << player
        end
      end

      def create_kill(killer_id:, victim_id:, death_type:)
        @kills << Kill.new(killer_id: killer_id.to_i,
                           victim_id: victim_id.to_i,
                           death_type:)
      end

      def total_kills
        Lib::Score::Calculator.new(players: @players,
                                   kills: @kills).total_kills
      end

      def kills_by_player
        Lib::Score::Calculator.new(players: @players,
                                   kills: @kills).kills_by_player
      end

      def kills_by_world
        Lib::Score::Calculator.new(players: @players,
                                   kills: @kills).kills_by_world
      end

      def kills_by_death_type
        Lib::Score::Calculator.new(players: @players,
                                   kills: @kills).kills_by_death_type
      end
    end
  end
end
