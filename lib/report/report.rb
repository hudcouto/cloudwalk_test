# frozen_string_literal: true

require 'json'
require_relative '../models/match'

module Lib
  module Report
    class Report
      def initialize(matches:)
        @matches = matches
      end

      def default
        data = {}
        @matches.each_with_index do |match, index|
          data["game_#{index + 1}"] = {
            total_kills: match.total_kills,
            players: match.players.map(&:name).sort,
            kills: generate_kills(players: match.players, kills: match.kills_by_player)
          }
        end
        JSON.pretty_generate(data)
      end

      private

      def generate_kills(players:, kills:)
        data = {}
        players.each { |player| data[player.name] = kills[player.id] || 0 }

        data.sort_by { |_key, value| -value }.to_h
      end
    end
  end
end
