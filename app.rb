# frozen_string_literal: true

require 'json'
require_relative './lib/parser/parser'
require_relative './lib/report/report'

FILE = "#{__dir__}/data/qgames.log".freeze

class App
  def read_file
    file = File.open(FILE)
    parsed_file = Lib::Parser::Parser.new(file:).parser
    report = Lib::Report::Report.new(matches: parsed_file).default
    File.write('report.json', report)
  end
end

App.new.read_file
