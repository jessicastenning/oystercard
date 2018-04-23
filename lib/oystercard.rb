class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Balance cannot exceed £90' if @balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey == true
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
