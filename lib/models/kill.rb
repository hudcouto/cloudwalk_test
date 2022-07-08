# frozen_string_literal: true

module Lib
  module Models
    class Kill
      attr_reader :killer_id, :victim_id, :death_type

      def initialize(killer_id:, victim_id:, death_type:)
        @killer_id = killer_id
        @victim_id = victim_id
        @death_type = death_type
      end

      def by_world?
        @killer_id == 1022
      end

      def by_suicide?
        @killer_id == @victim_id
      end
    end
  end
end
