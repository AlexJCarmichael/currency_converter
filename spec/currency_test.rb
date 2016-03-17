require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def setup
  end

  def test_exists?
    currency = Currency.new(5)
    assert(currency)
  end

  def test_amount
    currency = Currency.new(5)
    assert_equal(currency.amount, 5)
  end
end
