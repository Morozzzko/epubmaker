# frozen_string_literal: true

require 'epub_maker/cli/commands/version'
require 'epub_maker/cli/commands/generate/epub'
require 'epub_maker/cli/commands/generate/directory'

module EPUBMaker
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register 'version', Version, aliases: %w[v]

      register 'generate', aliases: %w[g] do |prefix|
        prefix.register 'directory', Generate::Directory, aliases: %w[dir]
        prefix.register 'archive', Generate::EPUB, aliases: %w[epub]
      end
    end
  end
end
