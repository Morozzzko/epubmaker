# frozen_string_literal: true

require 'gepub'

module EPUBMaker
  module CLI
    module Commands
      module Generate
        class EPUB < Dry::CLI::Command
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
