class Oystercard
  attr_reader :balance, :entry_station, :current_journey, :journeys

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1


  def initialize
    @balance = 0
    @journeys = []
    @current_journey = {}
  end

  def top_up(amount)
    raise 'Balance cannot exceed £90' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
      !!@current_journey[:entry_station]
  end

  def touch_in(station)
    raise 'Card balance is too low' if @balance < MINIMUM_BALANCE
    @current_journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @current_journey[:exit_station] = station
    save_journey
    reset_current_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def save_journey
    @journeys.push(current_journey)
  end

  def reset_current_journey
    @current_journey = {}
  end

end
