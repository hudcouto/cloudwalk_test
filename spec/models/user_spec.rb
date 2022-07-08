# frozen_string_literal: true

require './lib/models/user'

RSpec.describe Lib::Models::User do
  context 'when params are valid' do
    user = Lib::Models::User.new(id: 1, name: 'John')

    it 'should initialize a new user' do
      expect(user.name).to eq 'John'
      expect(user.id).to eq 1
    end
  end
end
