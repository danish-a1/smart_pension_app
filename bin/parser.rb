#!/usr/bin/env ruby

require_relative "../lib/parser"
require "optparse"
require "ostruct"

options = OpenStruct.new
options.mode = Parser::MODES.keys.first
options.sorter = Parser::SORTER.keys.first

OptionParser.new do |option|
  option.banner = "Usage: .bin\/parser.rb <path to file> [options]"
  option.separator ""
  option.separator "Specific options:"

  option.on("--mode [MODE]", Parser::MODES.keys, "Select mode: #{Parser::MODES.keys.join('/')}") do |mode|
    options.mode = mode
  end

  option.on("--sorter [SORTER]", Parser::SORTER.keys, "Select SORTER: #{Parser::SORTER.keys.join('/')}") do |sorter|
    options.sorter = sorter
  end
end.parse!

Parser.run(input_path: ARGV[0], mode: options[:mode], sorter: options[:sorter])