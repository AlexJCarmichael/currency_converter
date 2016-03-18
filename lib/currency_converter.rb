require_relative './currency.rb'
#currency_converter.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
# currency_converter.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
# Should be able to be created with a Hash of three or more currency codes and conversion rates. An example would be this: {USD: 1.0, EUR: 0.74, JPY: 120.0}, which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth 120/0.74 = 162.2 yen.
#
# Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
#
# Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.

class CurrencyConverter
  attr_accessor :rates
  def initialize
    @rates = {:USD => 1, :EUR => 0.88665}
  end

  def convert(currency_input, convert_to)
    conversion = (currency_input.amount * @rates.fetch(convert_to))
    Currency.new(conversion, convert_to)
  end

end
