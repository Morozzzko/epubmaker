# frozen_string_literal: true

require 'epub_maker/cli'

RSpec.describe EPUBMaker::CLI::Commands::Version do
  subject(:run) { described_class.new.call }

  it 'prints version' do
    expect { run }.to output(/#{EPUBMaker::VERSION}/).to_stdout
  end
end
