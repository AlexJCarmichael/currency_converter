require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def setup
  end

  def test_exists?
    currency = Currency.new(5, nil)
    assert(currency)
  end

  def test_amount
    currency = Currency.new(5, nil)
    assert_equal(currency.amount, 5)
  end

  def test_currency_code
    currency = Currency.new(nil, 'USD')
    assert_equal(currency.currency_code, 'USD')
  end

  def test_currency_equality
    assert_equal(Currency.new(10, 'USD'), Currency.new(10, 'USD'))
    assert_equal(Currency.new(20, 'USD'), Currency.new(20, 'USD'))
    assert_equal(Currency.new(125, 'JPY'), Currency.new(125, 'JPY'))
  end

end
