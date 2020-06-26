require 'yaml'
require_relative 'bex_gen/header'
require_relative 'bex_gen/things'

module BexGen
  extend self

  def call
    Header.print

    puts "[CODEPTR]"
    things.scramble_attacks
    things.populate_empty_frames
    puts ""
  end

  private

  def things
    @things ||= Things.new
  end
end

BexGen.call
