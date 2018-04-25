require 'oystercard'

describe Oystercard do
  let(:station) { double(:station) }
  describe '#top_up' do
    it 'should allow user to increase balance by a specified amount' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'should raise an error when top up results in balance > £90' do
      expect{ subject.top_up(91) }.to raise_error 'Balance cannot exceed £90'
    end
  end

  describe '#in_journey?' do
    it 'should not be in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'should fail if card balance < £1' do
      expect{ subject.touch_in(station) }.to raise_error 'Card balance is too low'
    end
    it 'should adjust status to in_journey' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
    it 'should remember the entry station after touch_in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq (station)
    end
  end
  describe '#touch_out' do
    before do
      subject.top_up(10)
      subject.touch_in(station)
    end
    it 'should adjust status to not_in_journey' do
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
    it 'should forget the entry station on touch_out' do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_out }.to change{ subject.entry_station}.to nil
    end
    it 'should reduce the balance on card by the cost of the journey' do
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
  end
end
#comment
