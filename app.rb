# frozen_string_literal: true

require 'json'
require_relative './lib/parser/parser'
require_relative './lib/report/report'

FILE = "#{__dir__}/data/qgames.log".freeze

class App
  def generate_reports
    matches = Lib::Parser::Parser.new(file: open_file).parser
    default_report = Lib::Report::Report.new(matches:).default
    generate_default_report(report: default_report)

    by_death_type_report = Lib::Report::Report.new(matches:).by_death_type
    generate_kills_by_death_type_report(report: by_death_type_report)
  end

  private

  def open_file
    File.open(FILE)
  end

  def generate_default_report(report:)
    File.write('default_report.json', report)
  end

  def generate_kills_by_death_type_report(report:)
    File.write('kills_by_death_type_report.json', report)
  end
end

App.new.generate_reports
