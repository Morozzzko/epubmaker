# frozen_string_literal: true

require 'epub_maker/version'

module EPUBMaker
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        def call(**)
          prompt.say "EPUBMaker version #{EPUBMaker::VERSION}"
        end
      end
    end
  end
end
