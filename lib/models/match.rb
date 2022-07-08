# frozen_string_literal: true

require_relative './user'
require_relative './kill'

module Lib
  module Models
    class Match
      attr_reader :players, :kills

      def initialize
        @players = {}
        @kills = []
      end

      def find_or_create_player(id:, name:)
        if @players.key(id)
          player = @players[id]
          player.name = name
        else
          player = User.new(id: id.to_i, name:)
          @players[id] = player
        end
      end

      def create_kill(killer_id:, victim_id:, death_type:)
        @kills << Kill.new(killer_id: killer_id.to_i, victim_id: victim_id.to_i, death_type:)
      end
    end
  end
end
