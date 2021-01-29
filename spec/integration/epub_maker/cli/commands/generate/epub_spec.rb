# frozen_string_literal: true

require 'epub_maker/cli'

RSpec.describe EPUBMaker::CLI::Commands::Generate::EPUB do
  subject(:run) { described_class.new.call(path: path) }

  let(:path) { Pathname.new(Tempfile.new.path) }

  it 'creates epub' do
    expect { run }.not_to raise_error

    expect(path).to exist
    expect(path).to be_file
  end
end
