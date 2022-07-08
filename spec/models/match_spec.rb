# frozen_string_literal: true

require './lib/models/match'

RSpec.describe Lib::Models::Match do
  context 'when start a new match' do
    match = Lib::Models::Match.new
    it 'should starts a empty list of players' do
      expect(match.players).to be_empty
    end
  end

  context 'adding new players' do
    match = Lib::Models::Match.new
    match.find_or_create_player(id: 1, name: 'Hudson')

    it 'should add a new player' do
      expect(match.players).not_to be_empty
      expect(match.players[1].name).to eq 'Hudson'
    end

    it 'add second player' do
      match.find_or_create_player(id: 2, name: 'Silva')
      expect(match.players).not_to be_empty
      expect(match.players[2].name).to eq 'Silva'
      expect(match.players.count).to eq 2
    end

    it 'update a existing player' do
      match.find_or_create_player(id: 1, name: 'Hudson C')
      expect(match.players[1].name).to eq 'Hudson C'
    end
  end

  context 'adding new kills' do
    match = Lib::Models::Match.new

    it 'adding a new kill' do
      match.create_kill(killer_id: 1, victim_id: 2, death_type: 'MOD_SHOTGUN')
      expect(match.kills[0].killer_id).to eq(1)
      expect(match.kills[0].victim_id).to eq(2)
      expect(match.kills[0].death_type).to eq 'MOD_SHOTGUN'
    end

    it 'adding another kill' do
      match.create_kill(killer_id: 2, victim_id: 4, death_type: 'MOD_SHOTGUN')
      expect(match.kills[1].killer_id).to eq(2)
      expect(match.kills[1].victim_id).to eq(4)
      expect(match.kills[1].death_type).to eq 'MOD_SHOTGUN'
    end
  end
end
