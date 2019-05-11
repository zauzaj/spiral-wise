require 'pry-rails'
require_relative '../../lib/matrix'

describe Matrix do
  let(:height) { 5 }
  let(:weight) { 3 }
  context '#new' do
    it 'should raise ArgumentError ' do
      expect do
        Matrix.new
      end.to raise_error(ArgumentError)
    end
    it 'should assign instance variables' do
      m = Matrix.new(weight, height)
      expect(m.instance_variable_get(:@height)).to_not be_nil
      expect(m.instance_variable_get(:@weight)).to_not be_nil
    end
  end
  context '#generate' do
    let(:matrix) { Matrix.new(weight, height) }
    before(:each) { matrix.generate() }

    context 'matrix' do

      it 'should assign @matrix instance variable' do
        expect(matrix.instance_variable_get(:@matrix)).to_not be_nil
      end

      it 'should return instance of array' do
        expect(matrix.instance_variable_get(:@matrix)).to be_instance_of Array
      end

      context 'dimensions' do
        it 'should contain nested arrays == height' do
          expect(matrix.instance_variable_get(:@matrix).size).to eq height
        end
        it 'should contain per each row == weight ' do
          expect(matrix.instance_variable_get(:@matrix)[0].size).to eq weight
        end
        it 'should contain total fields = height x weight ' do
          expect(matrix.instance_variable_get(:@matrix).flatten.size).to eq height*weight
        end
      end

    end
  end
end