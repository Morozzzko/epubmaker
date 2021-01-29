# frozen_string_literal: true

require 'dry/cli/utils/files'
require 'gepub'

module EPUBMaker
  module CLI
    module Commands
      module Generate
        class Directory < Dry::CLI::Command
          desc 'Generate a directory structure for future EPUB'

          argument :path, type: :string, required: true, desc: 'Directory path for epub. Will create if does not exist'

          def call(path:, **)
            path = Pathname.new(path)

            epub = GEPUB::Book.new('OEBPS/content.opf').generate_epub_stream

            Zip::File.open_buffer(epub) do |zip|
              zip.entries.each do |entry|
                dest_path = path.join(entry.name)
                Dry::CLI::Utils::Files.mkdir_p(dest_path)

                entry.extract(dest_path.to_s)
              end
            end

            prompt.say("Created epub source directory at #{path}")
          end
        end
      end
    end
  end
end
