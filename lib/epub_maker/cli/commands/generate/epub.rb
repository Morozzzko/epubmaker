# frozen_string_literal: true

require 'epub_maker/cli/tty_tools'
require 'gepub'

module EPUBMaker
  module CLI
    module Commands
      module Generate
        class EPUB < Dry::CLI::Command
          include TTYTools

          argument :path, type: :string, required: true, desc: 'Full destination path for epub'

          def call(path:, **)
            GEPUB::Book.new('OEBPS/content.opf').generate_epub(path)

            prompt.say("Created blank epub at #{path}")
          end
        end
      end
    end
  end
end
