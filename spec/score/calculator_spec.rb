# frozen_string_literal: true

require './lib/score/calculator'
require './lib/models/user'
require './lib/models/kill'

RSpec.describe Lib::Score::Calculator do
  context 'should calculate data to report' do
    players = [
      Lib::Models::User.new(id: 1, name: 'Hudson'),
      Lib::Models::User.new(id: 2, name: 'Silva'),
      Lib::Models::User.new(id: 3, name: 'John')
    ]
    kills = [
      Lib::Models::Kill.new(killer_id: 1, victim_id: 2, death_type: 'MOD_SHOTGUN'),
      Lib::Models::Kill.new(killer_id: 1, victim_id: 3, death_type: 'MOD_SHOTGUN'),
      Lib::Models::Kill.new(killer_id: 2, victim_id: 1, death_type: 'MOD_SHOTGUN')
    ]
    score = Lib::Score::Calculator.new(players:, kills:)

    it 'should return kills by world' do
      expect(score.kills_by_world).to eq 0
    end

    it 'should return kills by player' do
      expect(score.kills_by_player).to eq({ 1 => 2, 2 => 1 })
    end

    it 'should return total kills' do
      expect(score.total_kills).to eq 3
    end
  end
end
