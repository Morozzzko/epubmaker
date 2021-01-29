# frozen_string_literal: true

require 'erb'
require 'dry/cli/utils/files'

module EPUBMaker
  module Generator
    def template(template_file, destination_file_path, locals:)
      erb = ERB.new(File.read(template_file))
      output = erb.result_with_hash(locals)
      Dry::CLI::Utils::Files.write(destination_file_path, output)
    end
  end
end
