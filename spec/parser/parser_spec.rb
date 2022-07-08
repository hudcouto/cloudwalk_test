# frozen_string_literal: true

require './lib/parser/parser'

RSpec.describe Lib::Parser::Parser do
  file = [
    '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000\sv_minRate\0\sv_hostname\Code Miner Server\g_gametype\0\sv_privateClients\2\sv_maxclients\16\sv_allowDownload\0\dmflags\0\fraglimit\20\timelimit\15\g_maxGameClients\0\capturelimit\8\version\ioq3 1.36 linux-x86_64 Apr 12 2009\protocol\68\mapname\q3dm17\gamename\baseq3\g_needpass\0',
    '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/',
    '1:26 Kill: 1022 4 22: <world> killed Zeh by MOD_TRIGGER_HURT',
    '7:12 Kill: 4 2 7: Zeh killed Dono da Bola by MOD_ROCKET_SPLASH'
  ]

  context 'when exists a log' do
    parser = Lib::Parser::Parser.new(file:).parser

    it 'should parser file correctly' do
      expect(parser.count).to eq 1
    end

    it 'should created a new player' do
      expect(parser.first.players.count).to eq 1
    end

    it 'should create a new kills' do
      expect(parser.first.kills.count).to eq 2
    end
  end
end
