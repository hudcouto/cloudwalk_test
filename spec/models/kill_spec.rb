# frozen_string_literal: true

require './lib/models/kill'

RSpec.describe Lib::Models::Kill do
  context 'when params are valid and not death by world or suicide' do
    kill = Lib::Models::Kill.new(killer_id: 1, victim_id: 2, death_type: 'MOD_ROCKET_SPLASH')

    it 'should not death by world' do
      expect(kill.by_world?).to be_falsey
    end

    it 'should not death by suicide' do
      expect(kill.by_suicide?).to be_falsey
    end
  end

  context 'when death is by world' do
    kill = Lib::Models::Kill.new(killer_id: 1022, victim_id: 2, death_type: 'MOD_LAVA')

    it 'should be death by world' do
      expect(kill.by_suicide?).to be_falsey
      expect(kill.by_world?).to be_truthy
    end
  end

  context 'when death is by suicide' do
    kill = Lib::Models::Kill.new(killer_id: 2, victim_id: 2, death_type: 'MOD_SUICIDE')

    it 'should be death by world' do
      expect(kill.by_suicide?).to be_truthy
      expect(kill.by_world?).to be_falsey
    end
  end
end
