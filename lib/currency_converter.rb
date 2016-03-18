require_relative './currency.rb'

class UnknownCurrencyCodeError < StandardError
 def message
   "The currency you are trying to convert to or from is not contained in this database."
 end
end

class CurrencyConverter
  attr_accessor :rates
  def initialize
    @rates = {:USD => 1, :EUR => 0.88665, :JPY => 111.679}
  end

  def convert(currency_input, convert_to)
    raise UnknownCurrencyCodeError unless @rates.has_key?(currency_input.currency_code) &&
                                          @rates.has_key?(convert_to)
    if (currency_input.currency_code) == :USD
      conversion = (currency_input.amount * @rates.fetch(convert_to))
      conversion = conversion.round(3)
      Currency.new(conversion, convert_to)
    else
      conversion = (@rates.fetch(convert_to) / @rates.fetch(currency_input.currency_code))
      converted = currency_input.amount * conversion
      converted = converted.round(3)
      Currency.new(converted, convert_to)
    end
  end

end
