# frozen_string_literal: true

require 'epub_maker/cli/tty_tools'
require 'epub_maker/version'

module EPUBMaker
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        include TTYTools

        def call(**)
          prompt.say "EPUBMaker version #{EPUBMaker::VERSION}"
        end
      end
    end
  end
end
