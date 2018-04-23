require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'should have a balance' do
      expect(subject).to respond_to :balance
    end
  end

  describe '#top_up' do
    it 'should allow user to increase balance by a specified amount' do
      #expect(subject).to respond_to(:top_up).with(1).arguments
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'should raise an error when top up results in balance > £90' do
      expect{ subject.top_up(91) }.to raise_error 'Balance cannot exceed £90'
    end
  end
end
