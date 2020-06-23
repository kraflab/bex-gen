module BexGen
  module Header
    extend self

    def print
      puts "Patch File for DeHackEd v3.0"
      puts "# Created with BexGen"
      puts "# Note: Use the pound sign ('#') to start comment lines."
      puts ""
      puts "Doom version = 21"
      puts "Patch format = 6"
      puts ""
      puts ""
    end
  end
end
