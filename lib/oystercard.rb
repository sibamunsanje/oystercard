class Oystercard
  def initialize(balance: 0)
    @balance = balance
  end
  attr_reader :balance
end
  def top_up(amount)
    @balance = @balance + amount
  end
