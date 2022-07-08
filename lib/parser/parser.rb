# frozen_string_literal: true

require_relative '../models/match'

module Lib
  module Parser
    class Parser
      def initialize(file:)
        @file = file
        @matches = []
      end

      def parser
        match = nil
        @file.each do |line|
          if line.include? 'InitGame:'
            match = create_new_match
            @matches << match
          end

          instance_player(line:, match:) if line.include? 'ClientUserinfoChanged:'

          create_kill(line:, match:) if line.include? 'Kill:'
        end
        @matches
      end

      private

      def check_lines(line:)
        if line.include? 'InitGame:'
          match = create_new_match
          @matches << match
        end

        instance_player(line:, match:) if line.include? 'ClientUserinfoChanged:'

        create_kill(line:, match:) if line.include? 'Kill:'
      end

      def create_new_match
        Models::Match.new
      end

      def create_kill(line:, match:)
        _data, _action, killer_id, victim_id, _death_id, description = line.split(' ', 6)
        death_type = description.split(' ')[-1]
        match.create_kill(killer_id:, victim_id:, death_type:)
      end

      def instance_player(line:, match:)
        _data, _action, user_id, connection_info = line.split(' ', 4)
        user_name = connection_info.split('\\')[1]
        match.find_or_create_player(id: user_id.to_i, name: user_name)
      end
    end
  end
end
