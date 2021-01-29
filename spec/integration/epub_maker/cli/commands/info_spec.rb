# frozen_string_literal: true

require 'epub_maker/cli'

RSpec.describe EPUBMaker::CLI::Commands::Info do
  subject(:run) { described_class.new.call(epub_file_path: epub_file_path) }

  let(:epub_file_path) { fixture_path('test.epub') }

  it 'prints meta' do
    expect { run }.to output(/Identifier: /).to_stdout
  end
end
