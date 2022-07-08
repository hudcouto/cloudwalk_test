# frozen_string_literal: true

module Lib
  module Score
    class Calculator
      def initialize(players:, kills:)
        @players = players
        @kills = kills
      end

      def total_kills
        player_kills.values.sum + world_kills.values.sum
      end

      def kills_by_player
        player_kills.merge(world_kills) do |_key, value1, value2|
          value1 - value2
        end
      end

      def kills_by_world
        world_kills.values.sum
      end

      def kills_by_death_type
        @kills.reject(&:by_suicide?).group_by(&:death_type).transform_values(&:count)
      end

      private

      def world_kills
        @kills.select(&:by_world?)
              .group_by(&:victim_id)
              .transform_values(&:count)
      end

      def player_kills
        @kills.reject(&:by_world?)
              .reject(&:by_suicide?)
              .group_by(&:killer_id)
              .transform_values(&:count)
      end
    end
  end
end
