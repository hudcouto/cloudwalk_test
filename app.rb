# frozen_string_literal: true

require 'json'
require_relative './lib/parser/parser'
require_relative './lib/report/report'

FILE = "#{__dir__}/data/qgames.log".freeze

class App
  def read_file
    matches = Lib::Parser::Parser.new(file: open_file).parser
    report = Lib::Report::Report.new(matches:).default
    generate_report(report:)
  end

  private

  def open_file
    File.open(FILE)
  end

  def generate_report(report:)
    File.write('report.json', report)
  end
end

App.new.read_file
