# frozen_string_literal: true

require 'epub_maker/cli'
require 'tty/prompt/test'

RSpec.describe EPUBMaker::CLI::Commands::Generate::EPUB do
  subject(:run) { command.call(path: path) }

  let(:command) { described_class.new }

  let(:path) { Pathname.new(Tempfile.new.path) }
  let(:stub_prompt) { TTY::Prompt::Test.new }

  before do
    stub_prompt.input << "\n\n\n"
    stub_prompt.input.rewind
    allow(command).to receive(:prompt).and_return(stub_prompt)
  end

  it 'creates epub' do
    expect { run }.not_to raise_error

    expect(path).to exist
    expect(path).to be_file
  end
end
