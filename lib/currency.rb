
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
    if same_currency_issuer?(other)
      self.amount == other.amount
    end
  end

  def +(other)
    raise DifferentCurrencyCodeError unless same_currency_issuer?(other)
    code = self.currency_code
    Currency.new((self.amount + other.amount), code)
  end

  def -(other)
    raise DifferentCurrencyCodeError unless same_currency_issuer?(other)
    code = self.currency_code
    Currency.new((self.amount - other.amount), code)
  end

  def *(number)
    Currency.new((self.amount * number), self.currency_code)
  end

  private
  def same_currency_issuer?(other)
    self.currency_code == other.currency_code
  end
end
