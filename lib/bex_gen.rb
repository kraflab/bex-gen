require 'yaml'

module BexGen
  extend self

  def call
    attack = load_config('config/attack.yml')

    puts "Patch File for DeHackEd v3.0"
    puts "# Created with BexGen"
    puts "# Note: Use the pound sign ('#') to start comment lines."
    puts ""
    puts "Doom version = 21"
    puts "Patch format = 6"
    puts ""
    puts ""
    puts "[CODEPTR]"
    attack['frame'].each do |frame|
      action = attack['action'].sample
      puts "FRAME #{frame} = #{action}"
    end
    puts ""
  end

  private

  def load_config(filename)
    YAML.load(File.read(filename))
  end
end

BexGen.call
