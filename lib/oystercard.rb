class Oystercard

  MAX_BALANCE = 90

  def initialize(balance: 0)
    @balance = balance
  end

  attr_reader :balance

  def top_up(amount)
    raise ("max balance #{MAX_BALANCE} exceeded") if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
