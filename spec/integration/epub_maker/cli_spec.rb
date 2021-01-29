# frozen_string_literal: true

require 'open3'

RSpec.describe 'exe/epubmaker' do # rubocop:disable RSpec/DescribeClass
  let(:exec_path) { File.expand_path(File.join(__dir__, '../../../exe/epubmaker')) }

  specify do
    _stdout, status = Open3.capture2(exec_path, 'version')

    expect(status).to be_success
  end
end
