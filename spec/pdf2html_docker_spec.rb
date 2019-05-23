RSpec.describe Pdf2htmlDocker do
  let(:stubbed_env) { create_stubbed_env }
  let(:docker_command) { stubbed_env.stub_command('docker').returns_exitstatus(0) }
  it 'has a version number' do
    expect(Pdf2htmlDocker::VERSION).not_to be nil
  end

  context 'when given wrong number of arguments' do
    it 'throw a argument error' do
      expect { Pdf2htmlDocker.convert }.to raise_error(ArgumentError)
    end
  end
end
