require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_converter.rb'

class CurrencyConverterTest < Minitest::Test
  def test_exists?
    convert = CurrencyConverter.new
    assert(convert)
  end

  def c(amount, code)
    Currency.new(amount, code)
  end

  def cc
    CurrencyConverter.new
  end

  def test_rates
    assert_equal(cc.rates, {"USD" => 1, "EUR" => 0.88665})
  end
end
