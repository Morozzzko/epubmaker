# frozen_string_literal: true

require 'epub_maker/cli'
require 'tmpdir'

RSpec.describe EPUBMaker::CLI::Commands::Generate::Directory do
  subject(:run) { described_class.new.call(path: path) }

  let(:path) { Pathname.new(Dir.mktmpdir) }

  it 'creates epub in a directory' do
    expect { run }.not_to raise_error

    expect(path).to be_directory
    expect(path).not_to be_empty
  end
end
