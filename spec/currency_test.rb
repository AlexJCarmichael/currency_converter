require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def setup
  end

  def c(amount, code)
    Currency.new(amount, code)
  end

  def test_exists?
    currency = c(5, nil)
    assert(currency)
  end

  def test_amount
    currency = c(5, nil)
    assert_equal(currency.amount, 5)
  end

  def test_currency_code
    currency = c(nil, 'USD')
    assert_equal(currency.currency_code, 'USD')
  end

  def test_currency_equality
    assert_equal(c(10, 'USD'), c(10, 'USD'))
    assert_equal(c(20, 'USD'), c(20, 'USD'))
    assert_equal(c(125, 'JPY'), c(125, 'JPY'))
  end

  def test_currency_must_be_the_same_type
    refute_equal(c(10, 'USD'), c(10, 'JPY'))
    refute_equal(c(20, 'USD'), c(20, 'JPY'))
    refute_equal(c(125, 'JPY'), c(125, 'USD'))
  end

  def test_currency_is_not_equal_if_ammount_is_different
    refute_equal(c(10, 'USD'), c(11, 'USD'))
    refute_equal(c(20, 'USD'), c(21, 'USD'))
    refute_equal(c(125, 'JPY'), c(126, 'JPY'))
  end

  def test_adding_currencies_together
    assert_equal(c(20, 'USD'), (c(10, 'USD') + c(10, 'USD')))
    assert_equal(c(40, 'USD'), (c(20, 'USD') + c(20, 'USD')))
    assert_equal(c(250, 'JPY'), (c(125, 'JPY')+ c(125, 'JPY')))
  end

  def test_currencies_without_the_same_code_cannot_be_added
    assert_equal(nil, (c(10, 'JPY') + c(10, 'USD')))
    assert_equal(nil, (c(20, 'JPY') + c(20, 'USD')))
    assert_equal(nil, (c(125, 'USD')+ c(125, 'JPY')))
  end

end
