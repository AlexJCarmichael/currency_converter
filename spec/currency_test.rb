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

  def test_multiply_currency_by_a_Fixnum_or_Float
    assert_equal(c(300, 'USD'), (c(30, 'USD')* 10))
    assert_equal(c(120, 'USD'), (c(60, 'USD') * 2))
    assert_equal(c(500, 'JPY'), (c(50, 'JPY') * 10))
  end

  def test_cannot_multiply_currency_by_a_string
    assert_raises(TypeError) do (c(10, 'JPY') * 'USD')
    end
    assert_raises(TypeError) do (c(20, 'JPY') * 'USD')
    end
    assert_raises(TypeError) do (c(125, 'USD') * 'JPY')
    end
  end

  def test_accepts_a_single_string_with_a_currency_symbol_as_input
    assert_equal(c(30, :USD), (Currency.new("$30")))
    assert_equal(c(120, :USD), (Currency.new("$120")))
    assert_equal(c(50, :JPY), (Currency.new("¥50")))
    assert_equal(c(500, :EUR), (Currency.new("€500")))
    assert_equal(c(125, :EUR), (Currency.new("€125")))
  end

  def test_accepts_two_strings_as_an_input
    assert_equal(c(30, :USD), (c("$30", 'USD')))
    assert_equal(c(120, :USD), (c("$120", 'USD')))
    assert_equal(c(50, :JPY), (c("¥50", 'JPY')))
    assert_equal(c(120, :EUR), (c("€120", 'EUR')))
    assert_equal(c(50, :EUR), (c("€50", 'EUR')))
  end
end
