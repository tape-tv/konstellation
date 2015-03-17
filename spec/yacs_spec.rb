require 'spec_helper'

describe Yacs do
  subject { Yacs }

  describe '.yaml_path' do
    let(:path) { '/tmp/config.yml' }

    it 'returns a Pathname' do
      expect(subject.yaml_path(path)).to be_instance_of(Pathname)
    end

    it 'initializes a new Pathname with the passed-in path' do
      expect(Pathname).to receive(:new).with(path)

      subject.yaml_path(path)
    end
  end

  describe '.load' do
    include_context :uses_tmp_dir

    let(:path) { File.join(tmp_dir, 'config.yml') }

    context 'when the passed-in file path exists' do
      before do
        File.write(path, YAML.dump({
          foo: 'bar',
          'bar' => 'baz',
          baz: 42
        }))
      end

      it 'returns a correct hash based on the YAML' do
        expect(subject.load(path)).to eq({
          'foo' => 'bar',
          'bar' => 'baz',
          'baz' => 42
        })
      end

      it 'allows indifferent access' do
        expect(subject.load(path)['foo']).to eq('bar')
        expect(subject.load(path)[:foo]).to eq('bar')
      end

      context 'defaults' do
        it 'merges passed in defaults in development environment' do
          allow(subject).to receive(:development?) { true }

          expect(subject.load(path) do
            { foo: 'baz' }
          end[:foo]).to eq('baz')
        end

        it 'does not use the passed in defaults otherwise' do
          expect(subject.load(path) do
            { foo: 'baz' }
          end[:foo]).to eq('bar')
        end
      end
    end


    context 'when the passed-in file path is missing' do
      it 'uses the default' do
        expect(subject.load(path) do
          { 'foo' => 'baz' }
        end[:foo]).to eq('baz')
      end
    end
  end
end
