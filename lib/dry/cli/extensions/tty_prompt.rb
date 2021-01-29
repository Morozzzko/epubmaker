# frozen_string_literal: true

require 'dry/cli'
require 'tty-prompt'

module Dry
  class CLI
    class Command
      def prompt
        @prompt ||= TTY::Prompt.new
      end
    end
  end
end
