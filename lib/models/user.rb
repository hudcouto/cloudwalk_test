# frozen_string_literal: true

module Lib
  module Models
    class User
      attr_reader :id, :name

      def initialize(id:, name:)
        @id = id
        @name = name
      end
    end
  end
end
