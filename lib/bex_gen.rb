require 'yaml'
require_relative 'bex_gen/header'

module BexGen
  extend self

  def call
    attack = load_config('config/attack.yml')

    Header.print

    puts "[CODEPTR]"
    attack['frame'].each do |frame|
      action = pick_action(attack, frame)
      puts "FRAME #{frame} = #{action}"
    end
    puts ""
  end

  private

  def load_config(filename)
    YAML.load(File.read(filename))
  end

  def pick_action(attack, frame)
    while true
      action = attack['action'].sample

      return action unless attack['exclusions'][frame]&.include?(action)
    end
  end
end

BexGen.call
