# frozen_string_literal: true

FILE = "#{__dir__}/data/qgames.log"

class App
  def read_file
    file = File.open(FILE)
    puts "Number of lines #{file.readlines.size}"
  end
end

App.new.read_file
