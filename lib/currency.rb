
class DifferentCurrencyCodeError < StandardError
  def message
    "You cannot add or subtract currencies unless they are from the same government"
  end
end

class Currency
  attr_accessor :amount, :currency_code

  def initialize(amount, currency_code = nil)
    @currency_codes = {"$" => :USD, "€" => :EUR, "¥" => :JPY}
    @amount = amount
    @currency_code = currency_code
    if @amount.class == String && @currency_code == nil
      one_input_of_a_string_containing_a_currency_symbol
    elsif @amount.class == String && @currency_code.class == String
      two_string_inputs
    end
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

  def one_input_of_a_string_containing_a_currency_symbol
    sign = @amount.split(//)[0]
    if @currency_codes[sign]
      @currency_code = @currency_codes[sign]
    end
    to_convert_to_fixnum = @amount.split((/^[^\d]/))
    @amount = to_convert_to_fixnum[1].to_i
  end

  def two_string_inputs
    to_convert_to_fixnum = @amount.split((/^[^\d]/))
    @amount = to_convert_to_fixnum[1].to_i
    @currency_code = @currency_code.to_sym
  end

  private
  def same_currency_issuer?(other)
    self.currency_code == other.currency_code
  end
end
