# frozen_string_literal: true

require 'epub_maker/cli/commands/version'
require 'epub_maker/cli/commands/info'
require 'epub_maker/cli/commands/generate'

module EPUBMaker
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register 'version', Version, aliases: %w[v]

      register 'info', Info

      register 'generate', Generate, aliases: %w[g gen]
    end
  end
end
