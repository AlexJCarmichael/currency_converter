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
    assert_raises(DifferentCurrencyCodeError) do (c(10, 'JPY') + c(10, 'USD'))
    end
    assert_raises(DifferentCurrencyCodeError) do (c(20, 'JPY') + c(20, 'USD'))
    end
    assert_raises(DifferentCurrencyCodeError) do (c(125, 'USD') + c(125, 'JPY'))
    end
  end

  def test_subtracting_currencies_from_each_other
    assert_equal(c(20, 'USD'), (c(30, 'USD') - c(10, 'USD')))
    assert_equal(c(40, 'USD'), (c(60, 'USD') - c(20, 'USD')))
    assert_equal(c(250, 'JPY'), (c(375, 'JPY') - c(125, 'JPY')))
  end

  def test_currencies_without_the_same_code_cannot_be_subtracted
    assert_raises(DifferentCurrencyCodeError) do (c(10, 'JPY') - c(10, 'USD'))
    end
    assert_raises(DifferentCurrencyCodeError) do (c(20, 'JPY') - c(20, 'USD'))
    end
    assert_raises(DifferentCurrencyCodeError) do (c(125, 'USD') - c(125, 'JPY'))
    end
  end


end
