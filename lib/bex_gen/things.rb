module BexGen
  class Things
    CONFIG_FILE = 'config/things.yml'

    def initialize
      @attack_actions = []

      config.each do |thing, attributes|
        @attack_actions |= attributes['attack_actions']
      end
    end

    def scramble_attacks
      config.each do |thing, attributes|
        attributes['attack_frames'].each do |frame|
          action = pick_attack_action(attributes)

          print_code_pointer(frame, action)
        end
      end
    end

    def populate_empty_frames
      config.each do |thing, attributes|
        attributes['empty_frames'].each do |frame|
          if rand() < 0.1
            action = pick_attack_action(attributes)

            print_code_pointer(frame, action)
          end
        end
      end
    end

    private

    attr_reader :attack_actions

    def config
      @config ||= YAML.load(File.read(CONFIG_FILE))
    end

    def pick_attack_action(attributes)
      allowed_attack_actions(attributes).sample
    end

    def allowed_attack_actions(attributes)
      attack_actions.reject do |action|
        attributes['exclusions'].include?(action)
      end
    end

    def print_code_pointer(frame, action)
      puts "FRAME #{frame} = #{action}"
    end
  end
end
