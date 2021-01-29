# frozen_string_literal: true

require 'gepub'

module EPUBMaker
  module CLI
    module Commands
      class Info < Dry::CLI::Command
        argument :epub_file_path, type: :string, required: true, desc: 'Path to epub'

        def call(epub_file_path:, **)
          book = epub(epub_file_path)

          prompt.say(book.title&.content)

          print_metadata(book)
        end

        private

        def print_metadata(book)
          metadata_for_book(book).reject do |_field, value|
            value.nil? || value.empty?
          end.each do |field, value|
            prompt.say("#{field.to_s.capitalize}: #{value}")
          end
        end

        def metadata_from_list(list)
          list.map(&:content).reject(&:empty?).join(', ')
        end

        def metadata_for_book(book) # rubocop:disable Metrics/AbcSize
          metadata = book.metadata

          {
            creators: metadata_from_list(metadata.creator_list),
            contributors: metadata_from_list(metadata.contributor_list),
            languages: metadata_from_list(metadata.language_list),
            subjects: metadata_from_list(metadata.creator_list),
            description: book.metadata.description,
            date: book.metadata.date&.content,
            identifier: book.metadata.identifier&.content
          }
        end

        def epub(epub_file_path)
          GEPUB::Book.parse(File.open(epub_file_path))
        end
      end
    end
  end
end
