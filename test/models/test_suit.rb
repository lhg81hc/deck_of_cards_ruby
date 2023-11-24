# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module TestSuit
  class TestValidSuit < Minitest::Test
    def setup
      @suit = DeckOfCardsRuby::Suit.new('hearts')
    end

    def test_that_validation_will_not_raise_error
      assert_nil @suit.validate
    end

    def test_to_s_returns_given_value
      assert_equal 'hearts', @suit.to_s
    end

    def test_to_unicode_latitude_returns_matched_key_from_unicode_latitude
      assert_equal '1F0Bx', @suit.to_unicode_latitude
    end
  end

  class TestInvalidSuit < Minitest::Test
    def test_that_will_raise_error_when_initialize_with_an_invalid_value
      assert_raises(RuntimeError) { DeckOfCardsRuby::Suit.new('foo') }
    end
  end
end
