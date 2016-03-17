# Should be created with an amount and a currency code
# Should equal another Currency object with the same amount and currency code
# Should NOT equal another Currency object with different amount or currency code
# Should be able to be added to another Currency object with the same currency code
# Should be able to be subtracted by another Currency object with the same currency code
# Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.
# Should be able to be multiplied by a Fixnum or Float and return a new Currency object

class Currency
  attr_accessor :amount, :currency_code
  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end
end
