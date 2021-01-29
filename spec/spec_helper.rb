# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  add_group 'Executables', 'exe'
  track_files 'lib/**/*.rb'
  track_files 'exe/**/*.rb'
end

require 'epub_maker'
require 'dry/core/extensions'

module Dry
  class CLI
    extend Dry::Core::Extensions

    register_extension(:tty_prompt) do
      require 'dry/cli/extensions/tty_prompt'
    end

    load_extensions(:tty_prompt)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
