

# Should be able to be subtracted by another Currency object with the same currency code
# Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.
# Should be able to be multiplied by a Fixnum or Float and return a new Currency object

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
    if self.currency_code == other.currency_code
      code = self.currency_code
      Currency.new((self.amount + other.amount), code)
    end
  end

  def -(other)
    if self.currency_code == other.currency_code
      code = self.currency_code
      Currency.new((self.amount - other.amount), code)
    end
  end

end
