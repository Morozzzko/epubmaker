# frozen_string_literal: true

require 'tty-prompt'

module EPUBMaker
  module TTYTools
    def prompt
      @prompt ||= TTY::Prompt.new
    end
  end
end
