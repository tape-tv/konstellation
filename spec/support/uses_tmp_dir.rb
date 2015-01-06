require 'tmpdir'

shared_context :uses_tmp_dir do
  around do |example|
    Dir.mktmpdir('yacs-rspec-') do |dir|
      @tmp_dir = dir
      example.run
    end
  end

  attr_reader :tmp_dir
end
