require 'spec_helper'
require 'hiero'

RSpec.describe Hiero do
  describe '#is_out_of_bounds' do
    it 'tests for out of bounds' do

      expect{Hiero.new().is_out_of_bounds()}.not_to raise_error ArgumentError

      expect(Hiero.new().is_out_of_bounds()).to eq(false)

    end
  end
end
