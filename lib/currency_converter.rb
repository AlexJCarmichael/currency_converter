require_relative './currency.rb'

# Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)
# At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate. An example would be this: {USD: 1.0, EUR: 0.74}, which implies that a dollar is worth 0.74 euros.
# Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code. For example:
#
# currency_converter.convert( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
# Should be able to be created with a Hash of three or more currency codes and conversion rates. An example would be this: {USD: 1.0, EUR: 0.74, JPY: 120.0}, which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth 120/0.74 = 162.2 yen.
#
# Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
#
# Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.

class CurrencyConverter
  attr_accessor :rates
  def initialize
    @rates = {"USD" => 1, "EUR" => 0.88665}
  end
end
