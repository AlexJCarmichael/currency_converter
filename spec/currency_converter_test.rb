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
    assert_equal(cc.rates, {:USD => 1, :EUR => 0.88665})
  end

  def test_can_convert_currency
    currency_converter = cc
    assert_equal(c(8.8665, :EUR), currency_converter.convert(c(10, :USD), :EUR ))
    assert_equal(c(88.665, :EUR), currency_converter.convert(c(100, :USD), :EUR ))
    assert_equal(c(17.733, :EUR), currency_converter.convert(c(20, :USD), :EUR ))
  end
end
