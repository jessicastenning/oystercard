require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'should have a balance' do
      expect(subject).to respond_to :balance
    end
  end
end
