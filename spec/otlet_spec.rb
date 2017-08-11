require 'spec_helper'

RSpec.describe Otlet do
  it 'has a version number' do
    expect(subject::VERSION).not_to be nil
  end

  context '#scramble' do
  	context 'when the parameter is an array' do
  	  let(:array) { [1, 2, 3, 4, 5] }

	  it 'should return a scrambled array' do
	    expect(subject.scramble(array)).not_to eq(array)
	    expect(subject.scramble(array) - array).to be_empty
	  end
	end

	context 'when the parameter is not an array' do
	  let(:invalid_param) { {a: 1, b: 2} }
	  
	  it 'should raise an error' do
	    expect { subject.scramble(invalid_param).to raise_error('error') }
	  end
	end
  end
end
