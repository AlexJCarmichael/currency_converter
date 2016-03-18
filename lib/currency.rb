
class DifferentCurrencyCodeError < StandardError
 def message
   "You cannot add or subtract currencies unless they are from the same government"
 end
end

class Currency
  attr_accessor :amount, :currency_code
  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def ==(other)
    if self.currency_code == other.currency_code
      self.amount == other.amount
    end
  end

  def +(other)
    raise DifferentCurrencyCodeError unless self.currency_code == other.currency_code
    if self.currency_code == other.currency_code
      code = self.currency_code
      Currency.new((self.amount + other.amount), code)
    end
  end

  def -(other)
    raise DifferentCurrencyCodeError unless self.currency_code == other.currency_code
    if self.currency_code == other.currency_code
      code = self.currency_code
      Currency.new((self.amount - other.amount), code)
    end
  end

  def *(number)
    Currency.new((self.amount * number), self.currency_code)
  end

end
